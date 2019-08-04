package com.ko.diet.common.Util;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.StringTokenizer;
import java.util.Vector;
import java.text.*;


public class UtilBean {

  public UtilBean() {
  }

  
  /**
   * src가 null거나 ""이면 tgt값으로 치환하여 return한다
   */
  static public String nvl(String src, String tgt) {
    String res = tgt;
    if (tgt == null) {
      res = "";
    }
    if (src == null) {
      return res;
    }
    else if (src.equals("")) {
      return res;
    }
    else {
      return src;
    }
  }

  /**
   * 문자열중 특정문자를 치환한다
   * 
   * @param str 대상문자열
   * @param src 치환당할 문자
   * @param tgt 치환할 문자
   * @return    완성된 문자열
   */
  public static String replace(String str, String src, String tgt) {
    StringBuffer buf = new StringBuffer();
    String ch = null;

    if ((str == null) || (str.length() == 0)) {
      return "";
    }
    int i = 0;
    int len = src.length();

    while (i < str.length() - len + 1) {
      ch = str.substring(i, i + len);
      if (ch.equals(src)) {
        buf.append(tgt);
        i = i + len;
      }
      else {
        buf.append(str.substring(i, i + 1));
        i++;
      }
    }

    if (i < str.length()) {
      buf.append(str.substring(i, str.length()));
    }

    return buf.toString();
  }

  /**
   * 문자열중 특정문자를 제거한다 (예) 2001/01/01 ==> 20010101
   * 
   * @param str 대상문자열
   * @param tok 제거 할 문자열
   * @return    완성된 문자열
   */
  public static String remove(String str, String tok) {
    return replace(str, tok, "");
  }

  /**
   * String을 int값으로 변환한다. <BR>
   * int cnt = beanUtil.stoi("10"); <BR>
   * 
   * @param str int값으로 변환될 String문자열.
   * @return 변환된 int 값.
   */
  public static int stoi(String str) {
    if (str == null) {
      return 0;
    }
    return (Integer.valueOf(str).intValue());
  }

  /**
   * int값을 String으로 변환한다. <BR>
   * 예) Strint str = beanUtil.itos(10); <BR>
   * 
   * @param i String으로 변환될 int 값.
   * @return 변환된 String 값.
   */
  public static String itos(int i) {
    return (new Integer(i).toString());
  }

  /**
   * 문자열을 전화번호와 '-'로 변환한다. <BR>
   * 예) Strint str = 016-333-4444; <BR>
   * 
   * @param str 전화번호.
   * @return '-'가 포함된 전화번호.
   */
  public static String getTel(String str) {
    // 0. first check if the number is belong to cellular phone( 011, 016, 017, 018, 019 )
    // 0.1 if so firstly we need to identify the last code (4) firstly,
    // 0.2 and get the middle code then.

    // 1. first check if it area code is belong to Seoul
    // 1.1 if Station begins with 2 -- it should be divided 4-4
    // 1.1 if station begins with 3 -- we need to identigy last code 4 digit

    // 2. and the code should be belong to Province code
    // 2.1 all province code has 3-4 number type

    String one = null, two = null, three = null, phone = null;
    int telsize = str.length();
    if (telsize == 0) { // if array doesn't contain anything.
      phone = "";
      return phone;
    }

    String header0 = str.substring(0, 1);
    String header1 = str.substring(1, 2);
    String header2 = str.substring(2, 3);

    if (header0.equals("9")) { // '9'로 시작되는 번호인가 ?
      String rest = str.substring(1, telsize);
      if (rest.length() >= 9) {
        if (header1.equals("0") && header2.equals("2")) { // if Seoul ?
          one = "9-02";
          two = str.substring(3, telsize - 4);
          three = str.substring(telsize - 4, telsize);
        }
        else if (header1.equals("0") && header2.equals("1")) { // if Mobile ?
          one = "9-" + str.substring(1, 4);
          two = str.substring(4, telsize - 4);
          three = str.substring(telsize - 4, telsize);
        }
        else if (header1.equals("0")
            && (!header2.equals("1")) && (!header2.equals("2"))) {
          // '0'으로 시작하지만 서울지역번호나 핸드폰번호가 아닌 경우
          one = "9-" + str.substring(1, 4);
          two = str.substring(4, telsize - 4);
          three = str.substring(telsize - 4, telsize);
        }
      }
      else {
        one = "9";
        two = str.substring(1, telsize - 4);
        three = str.substring(telsize - 4, telsize);
      }
    }
    else if (header0.equals("0") && header1.equals("2")) { // if Seoul ?
      // out.println(" Seoul : 02 : cnt : " + cnt );
      one = "02";
      // out.println(" 02 Entered <BR>");
      two = str.substring(2, telsize - 4);
      // out.print(" Second part <BR>");
      three = str.substring(telsize - 4, telsize);
      // out.print(" Last Part <BR>");
    }
    else if (header0.equals("0") && header0.equals("1")) { // if Mobile ?
      // out.println(" Cell : 01? : cnt : " + cnt );
      one = str.substring(0, 3);
      two = str.substring(3, telsize - 4);
      three = str.substring(telsize - 4, telsize);
    }
    else {
      // out.println(" Etc : ***: cnt : " + cnt );
      one = str.substring(0, 3);
      two = str.substring(3, telsize - 4);
      three = str.substring(telsize - 4, telsize);
    }
    // Logger.debug.println("[CLS][UtilBean][TelFormat] one ==> " + one);
    // Logger.debug.println("[CLS][UtilBean][TelFormat] two ==> " + two);
    // Logger.debug.println("[CLS][UtilBean][TelFormat] three ==> " + three);
    phone = one + "-" + two + "-" + three;
    return phone;
  } // end getTel()

  /**
   * 지역번호나 핸드폰 앞자리를 제외한 전화번호를 "국번-번호"로 변환한다. <br>
   * 예) Strint str = "333-4444"; <BR>
   * 
   * @param i '-'를 포함하지 않은 국번,번호
   * @return 국번-전화번호 뒷4자리
   */
  public static String getShortTel(String str) {
    String one = null, two = null, phone = null;
    int telsize = str.length();
    if (telsize == 0) {
      phone = "";
      return phone;
    }
    one = str.substring(0, telsize - 4);
    two = str.substring(telsize - 4, telsize);
    phone = one + "-" + two;
    return phone;
  } // end

  /**
   * 전화번호를 "-"를 넣어 변경한다. 예) Strint str = "333-4444"; <BR>
   * 
   * @param i '-'를 포함하지 않은 국번,번호
   * @return 국번-전화번호 뒷4자리
   */
  public static String getFormattedTel(String str) {
    String phone = "";
    if ((str.length() == 7) || (str.length() == 8)) {
      phone = getShortTel(str);
    }
    else if (str.length() >= 9) {
      phone = getTel(str);
    }
    else if (str.length() < 7) {
      phone = str;
    }
    return phone;
  }

  /**
   * 현재(한국기준) 날짜정보를 얻는다. <BR>
   * (예) 입력파리미터인 format string에 "/"를 셋팅하면 1998/12/10/과 같이 Return. <BR>
   * String CurrentDate = beanUtil.getCurrentDate("/");<BR>
   * 
   * @param format 얻고자하는 현재시간의 Type
   * @return String yyyy/mm/dd형태의 현재 한국시간. <BR>
   */
  public static String getCurrentDate(String format) {
    SimpleDateFormat fmt = new SimpleDateFormat("yyyy" + format + "MM" + format + "dd");
    Calendar aCalendar = Calendar.getInstance();
    String str = fmt.format(aCalendar.getTime());
    return str;
  }

  /**
   * 현재(한국기준) 날짜정보를 얻는다. <BR>
   * (예) 입력파리미터인 format string에 ":"를 셋팅하면 10:45과 같이 Return. <BR>
   * String str = beanUtil.getFormatDate(strr);<BR>
   * 
   * @param format
   *          얻고자하는 현재시간의 Type
   * @return String yyyy/mm/dd형태의 현재 한국시간. <BR>
   */
  public static String getFormatTime(String strr) {
    StringBuffer strbf = new StringBuffer();
    strbf.append(strr.substring(0, 2)).append(":").append(strr.substring(2, 4));

    String str = strbf.toString();
    return str;
  }

  /**
   * 현재(한국기준) 날짜정보를 얻는다. <BR>
   * (예) 입력파리미터인 format string에 "-"를 셋팅하면 1998-12-10 12:10.45과 같이 Return. <BR>
   * String str = beanUtil.getFormatDate(strr);<BR>
   * 
   * @param format
   *          얻고자하는 현재시간의 Type
   * @return String yyyy/mm/dd형태의 현재 한국시간. <BR>
   */
  public static String getFormatDate(String strr) {
    StringBuffer strbf = new StringBuffer();
    String str = new String();
    try {
      if (strr.length() == 4) { // 09:20
        strbf.append(strr.substring(0, 2)).append("-").append(strr.substring(2));
      }
      else if (strr.length() == 6) { // 2002/09
        strbf.append(strr.substring(0, 4)).append("-")
             .append(strr.substring(4));
      }
      else if (strr.length() == 8) { // 2004/09/20
        strbf.append(strr.substring(0, 4)).append("-")
             .append(strr.substring(4, 6)).append("-")
             .append(strr.substring(6));
      }
      else if (strr.length() == 10) { // 2004/09/20-10
        strbf.append(strr.substring(0, 4)).append("-")
             .append(strr.substring(4, 6)).append("-")
             .append(strr.substring(6, 8)).append(" ")
             .append(strr.substring(8));
      }
      else if (strr.length() == 12) { // 2004/09/20-10:30
        strbf.append(strr.substring(0, 4)).append("-")
             .append(strr.substring(4, 6)).append("-")
             .append(strr.substring(6, 8)).append(" ")
             .append(strr.substring(8, 10)).append(":")
             .append(strr.substring(10));
      }
      else if (strr.length() == 14) { // 2004/09/20-10:30:20
        strbf.append(strr.substring(0, 4)).append("-")
             .append(strr.substring(4, 6)).append("-")
             .append(strr.substring(6, 8)).append(" ")
             .append(strr.substring(8, 10)).append(":")
             .append(strr.substring(10, 12)).append(":")
             .append(strr.substring(12));
      }
      else if (strr.length() == 16) { // 2004/09/20-10:30:20.03
        strbf.append(strr.substring(0, 4)).append("-")
             .append(strr.substring(4, 6)).append("-")
             .append(strr.substring(6, 8)).append(" ")
             .append(strr.substring(8, 10)).append(":")
             .append(strr.substring(10, 12)).append(":")
             .append(strr.substring(12, 14)).append(".")
             .append(strr.substring(14));
      }
      else { // 입력받은 값 그대로 다시 리턴
        strbf.append(strr);
      }
      str = strbf.toString();
    }
    catch (Exception ex) {
      ex.printStackTrace();
    }
    return str;
  }

  public String getFormattedMoney(int money) {
    String moneystr = new String();
    try {
      moneystr = UtilBean.itos(money);
    }
    catch (Exception ex) {
      ex.printStackTrace();
    }
    return getFormattedMoney(moneystr);
  }

  public String getFormattedMoney(String moneystr) {
	  
	   double result = Double.parseDouble(moneystr);

	      NumberFormat fmat = NumberFormat.getInstance();
	      if (fmat instanceof DecimalFormat){
	          ((DecimalFormat) fmat).setDecimalSeparatorAlwaysShown(false);
	      }
	      return fmat.format((double)result);


  }
  
  public static String getPaging(int totalCount, int current_page, 
      int page_line, int pagePerList) {
    //Logger.debug.println("[CLS][UtilBean][getPaging] totalCount ==> " + totalCount);
    //Logger.debug.println("[CLS][UtilBean][getPaging] currentpage==> " + current_page);
    //Logger.debug.println("[CLS][UtilBean][getPaging] page_line  ==> " + page_line);
    //Logger.debug.println("[CLS][UtilBean][getPaging] pagePerList==> " + pagePerList);
    
    String ret = "";
    int tot_list = totalCount;
    int pre_page = current_page;
    int tot_page = 0; // 총페이지수
    int total_page = 0; // 총 페이징 페이지수
    int cur_page = 0; // 현재 페이징 페이지수
    int start_page = 0; // 페이징 시작 페이지
    int end_page = 0; // 페이징 마지막 페이지
    int prev_page = 0; // 이전 페이징 페이지
    int next_page = 0; // 다음 페이징 페이지
    int check = 0;

    if (tot_list % pagePerList > 0) {
      check = 1;
    }

    tot_page   = (tot_list) / pagePerList + check;
    total_page = (tot_page - 1) / page_line + 1;
    cur_page   = (pre_page - 1) / page_line + 1;
    start_page = (cur_page - 1) * page_line + 1;
    end_page   = cur_page * page_line;
    prev_page  = start_page - 1;
    next_page  = end_page + 1;

    //Logger.debug.println("[CLS][UtilBean][getPaging] tot_page  ==> " + tot_page);
    //Logger.debug.println("[CLS][UtilBean][getPaging] total_page==> " + total_page);

    ret = "<table width='100%' border=0 cellpadding=0 cellspacing=0>"
         + "<tr><td height=5></td></tr>";
    ret += "<tr align=center><td>";
    if (cur_page > 1) {
      ret += "<a href=\"javascript:goPage(1);\">"
           + "<img src=\"/images/pre01_bt.gif\" border=0 hspace=3 align=absmiddle></a>"
           + "<a href=\"javascript:goPage(" + prev_page + ");\">"
           + "<img src=\"/images/pre02_bt.gif\" border=0 hspace=3 align=absmiddle></a>";
    }
    else {
      ret += "<img src=\"/images/pre01_bt.gif\" hspace=3 align=absmiddle>"
          + "<img src=\"/images/pre02_bt.gif\" hspace=3 align=absmiddle>";
    }

    for (int i = start_page; i <= end_page; i++) {
      if (i <= tot_page) {
        if (i == pre_page) {
          if ((i == end_page)
              || (pre_page == tot_page)) {
            ret += "<b>" + i + "</b>";
          }
          else {
            ret += "<b>" + i + "</b>&nbsp;<font color='#B3B3B3'>|</font>";
          }
        }
        else {
          if ((i == end_page)
              || (i == tot_page)) {
            ret += "<a href=\"javascript:goPage(" + i 
                + ");\" class=\"number\" alt=\"" + i + "페이지로 이동\">"
                + i + "</a>";
          }
          else {
            ret += "<a href=\"javascript:goPage(" + i
                + ");\" class=\"number\" alt=\"" + i + "페이지로 이동\">"
                + i + "</a>&nbsp;<font color='#B3B3B3'>|</font>";
          }
        }
      }
    }

    if (cur_page < total_page) {
      ret += "<a href=\"javascript:goPage("
          + next_page + ");\">"
          + "<img src=\"/images/next02_bt.gif\" border=0 hspace=3 align=absmiddle></a>"
          + "<a href=\"javascript:goPage(" + tot_page + ");\">"
          + "<img src=\"/images/next01_bt.gif\" border=0 hspace=3 align=absmiddle></a>";
    }
    else {
      ret += "<img src=\"/images/next02_bt.gif\" hspace=3 align=absmiddle>"
          + "<img src=\"/images/next01_bt.gif\" hspace=3 align=absmiddle>";
    }
    if (totalCount == 0) {
      ret = "";
    }
    ret += "</td></tr></table>";
    return ret;
  }

  /**
   * 현재(한국기준) 날짜정보를 얻는다. <BR>
   * (예) 입력파리미터인 format string에 "/"를 셋팅하면 1998/12/10-12:10:45과 같이 Return. <BR>
   * String str = beanUtil.getFormatDate(strr);<BR>
   * 
   * @param format 얻고자하는 현재시간의 Type
   * @return String yyyy/mm/dd형태의 현재 한국시간. <BR>
   */
  public Vector getPage(int total, int counts) {
    Vector pagesVec = new Vector();
    HashMap hmap = null;
    int modresult = 0, divresult = 0;

    try {
      modresult = total % counts;
      divresult = total / counts;
      if (modresult > 0) {
        divresult += 1;
      }
//      Logger.debug.println("[UtilBean:getPages] total      = " + total);
//      Logger.debug.println("[UtilBean:getPages] counts     = " + counts);
//      Logger.debug.println("[UtilBean:getPages] modresult  = " + modresult);
//      Logger.debug.println("[UtilBean:getPages] divresult  = " + divresult);

      for (int i = 0; i < divresult; i++) {
        hmap = new HashMap();
        int pagenumber = i + 1;
        hmap.put("PAGE_NUMBER", "" + pagenumber);
        if (i == 0) {
          hmap.put("PAGE_START", "" + 1);
        }
        else {
          int startpage = (20 * i) + 1;
          hmap.put("PAGE_START", "" + startpage);
        }
        pagesVec.addElement(hmap);
      }
    }
    catch (Exception ex) {
      ex.printStackTrace();
    }
    return pagesVec;
  }

  public static String chkProcess(String sGbn) {
    String tLine = "";
    Process p = null;
    InputStream stdout = null;
    try {
      //자바에서는 "|"를 지원하지 않는다. 이를 위해 sh -c 를 앞에 붙여주는 것이다.
      String[] cmd = { "/bin/sh", "-c", "ps ax | grep -v grep | grep " + sGbn };
      //String[] cmd = { "/bin/sh", "-c", "ps ax | grep "+ sGbn };
      //String[] cmd = { "/bin/sh", "-c", "ps -ef | grep "+ sGbn };
      System.out.println("[chkProcess         ] cmd = " + cmd);
      try {
        p = Runtime.getRuntime().exec(cmd);
      }
      catch (Exception ex) {
        System.out.println("[chkProcess         ] " + ex.toString());
      }

      try {
        stdout = p.getInputStream();
        BufferedReader out_br = new BufferedReader(new InputStreamReader(stdout));
        System.out.println("[chkProcess         ] out_br = " + out_br);
        
        String line = null;
        int x = 0;
        while ((line = out_br.readLine()) != null) {
          System.out.println("[chkProcess         ] line = " + line);
          StringTokenizer st = new StringTokenizer(line, " ");
          if (x == 0) {
            tLine = st.nextToken();
            System.out.println("[chkProcess         ] tLine = " + tLine);
          }
          else {
            tLine += "|" + st.nextToken();
            System.out.println("[chkProcess         ] tLine | = " + tLine);
          }
          x += 1;
        }
//        Logger.debug.println("[chkProcess         ] line = " + line);
        /*
        String temp = null;
        while ((temp = out_br.readLine())!= null) {
          line.append(temp).append("|");
        }
        System.out.println("[chkProcess         ] line = " + line);
        */
      }
      catch (IOException e) {
        System.out.println("[chkProcess         ] " + e.toString());
      }
    }
    catch (Exception e) {
      System.out.println("[chkProcess         ] " + e.toString());
    }
    finally {
      try {
        stdout.close();
      }
      catch (IOException e) {
        System.out.println("[chkProcess         ] " + e.toString());
      }
    }
    return tLine.trim();
  }

  public static String chkSWBKProcess(String sGbn) {
    String tLine = "";
    Process p = null;
    InputStream stdout = null;
    try {
      // String[] cmd = {"sh", "-c", "ps -e | grep "+sGbn};
      String[] cmd = { "/bin/sh", "-c", "ps -e | grep -v grep | grep "+sGbn+"'" };
      try {
        p = Runtime.getRuntime().exec(cmd);
      }
      catch (Exception ex) {
        System.out.println("[chkSWBKProcess     ] " + ex.toString());
      }

      try {
        stdout = p.getInputStream();
        BufferedReader out_br = new BufferedReader(new InputStreamReader(stdout));
        System.out.println("[chkSWBKProcess     ] out_br = " + out_br);

        String line = null;
        line = out_br.readLine();
        System.out.println("[chkSWBKProcess     ] line = " + line);
//        Logger.debug.println("[chkSWBKProcess     ] line = " + line);
        /*
        int x = 0;
        while ((line = out_br.readLine()) != null) {
          System.out.println("[chkProcess         ] line = " + line);
          StringTokenizer st = new StringTokenizer(line, " ");
          if (x == 0) {
            tLine = st.nextToken();
            System.out.println("[chkProcess         ] tLine = " + tLine);
          }
          else {
            tLine += "|" + st.nextToken();
            System.out.println("[chkProcess         ] tLine | = " + tLine);
          }
          x += 1;
        }
        */
      }
      catch (IOException e) {
        System.out.println("[chkSWBKProcess     ] " + e.toString());
      }
    }
    catch (Exception e) {
      System.out.println("[chkSWBKProcess     ] " + e.toString());
    }
    finally {
      try {
        stdout.close();
      }
      catch (IOException e) {
        System.out.println("[chkSWBKProcess     ] " + e.toString());
      }
    }
    return tLine.trim();
  }

  public static String getProcessFileName(String sGbn) {
    Process p = null;
    InputStream stdout = null;
    String tLine = "";
    try {
      //String df = new String();
      //String[] cmd = { "/bin/sh", "-c", "ps -ef | grep " + sGbn };
      //String[] cmd = { "/bin/sh", "-c", "ps ax | grep " + sGbn };
      String[] cmd = { "/bin/sh", "-c", "ps -ewwo cmd | grep -v grep | grep " + sGbn };
      try {
        p = Runtime.getRuntime().exec(cmd);
      }
      catch (Exception ex) {
        System.out.println("[getProcessFileName ] " + ex.toString());
      }

      try {
        stdout = p.getInputStream();
        BufferedReader out_br = new BufferedReader(new InputStreamReader(stdout));
        System.out.println("[getProcessFileName ] " + out_br);
        String line = null;
        int x = 0;
        while ((line = out_br.readLine()) != null) {
          if (x == 0) {
            tLine += line;
          }
          x += 1;
        }
      }
      catch (IOException e) {
        System.out.println("[getProcessFileName ] " + e.toString());
      }

      try{
        int c = 0;
        String temp = "";
        if (!tLine.equals("")) { 
          c = tLine.lastIndexOf("/");
          temp = tLine.substring(c + 1);
        }
        if (!temp.equals("") && !temp.startsWith("sh")) {
          c = temp.lastIndexOf(".");
          return temp.substring(0, c) + ".dump";
        }
        else {
          return "";
        }
      }
      catch (Exception e) {
        System.out.println("[getProcessFileName ] " + e.toString());
      }
    }
    catch (Exception e) {
      return "";
    }
    finally {
      try {
        stdout.close();
      }
      catch (IOException e) {
        System.out.println("[getProcessFileName] " + e.toString());
      }
    }
    return "";
  }

  public static String getDBBackupFileName(String sGbn) {
    InputStream stdout = null;
    try {
      Process p = null;
      //String[] cmd = { "/bin/sh", "-c", "ps -ef | grep " + sGbn };
      //String[] cmd = { "/bin/sh", "-c", "ps ax | grep " + sGbn };
      String[] cmd = { "/bin/sh", "-c", "ps -ewwo cmd | grep -v grep | grep " + sGbn };
//      Logger.debug.println("[CLS][getDBBackupFileName ] cmd : "+cmd);
      try {
        p = Runtime.getRuntime().exec(cmd);
      }
      catch (Exception ex) {
        System.out.println("[getDBBackupFileName] " + ex.toString());
      }

      String tLine = "";
      try {
        stdout = p.getInputStream();
        BufferedReader out_br = new BufferedReader(new InputStreamReader(stdout));
        System.out.println("[getDBBackupFileName ] " + out_br);
        String line = null;

        int x = 0;
        while ((line = out_br.readLine()) != null) {
          if (x == 0) {
            tLine += line;
          }
          x += 1;
        }
        
      }
      catch (IOException e) {
        System.out.println("[getDBBackupFileName] " + e.toString());
      }
      try {
        int c = (tLine!=null && !tLine.equals("") ? tLine.lastIndexOf(":") : 0);
        String temp = (c > 0 ? tLine.substring(c + 1) : "");
        
        if (!temp.equals("") && !temp.startsWith("sh")) {
          c = temp.lastIndexOf(".");
        
          return temp.substring(0, c) + ".dump";
        }
        else {
          return "";
        }
      }
      catch (Exception ex) {
        System.out.println("[getDBBackupFileName ] " + ex.toString());
      }
    }
    catch (Exception e) {
      System.out.println("[getDBBackupFileName] " + e.toString());
      return "";
    }
    finally {
      try {
        stdout.close();
      }
      catch (IOException e) {
        System.out.println("[getDBBackupFileName] " + e.toString());
      }
    }
    return "";
  }

  //백업기능을 전체백업이 아닌 테이블별 백업으로 바꾸며 수정한 부분 -20100310
  /*
  public static String chkProcess(String sGbn) {
    String tLine = "";
    InputStream stdout = null;
    try {
      String[] cmd = { "sh", "-c", "ps -e | grep "+ sGbn };
      Process p = Runtime.getRuntime().exec(cmd);

      stdout = p.getInputStream();
      BufferedReader out_br = new BufferedReader(new InputStreamReader(stdout));

      String line = null;
      int x = 0;
      while ((line = out_br.readLine()) != null) {
        StringTokenizer st = new StringTokenizer(line, " ");
        if (x == 0) {
          tLine = st.nextToken();
        }
        else {
          tLine += "|" + st.nextToken();
        }
        x += 1;
      }
    }
    catch (IOException e) {
      System.out.println("[UtilBean] " + e.toString());
    }
    finally {
      try {
        stdout.close();
      }
      catch (IOException e) {
        System.out.println("[UtilBean] " + e.toString());
      }
    }
    return tLine.trim();
  }

  public static String chkSWBKProcess(String sGbn) {
    String tLine = "";
    InputStream stdout = null;
    try {
      // String[] cmd = {"sh", "-c", "'ps -e | grep "+sGbn+"'"};
      String[] cmd = { "/bin/sh", "-c", "'ps -e'" };
      // String cmd = "ps -e | grep "+sGbn;
      // Logger.debug.println("[UtilBean:chkSWBKProcess] cmd ==> " + cmd );
      Process p = Runtime.getRuntime().exec(cmd);

      stdout = p.getInputStream();

      BufferedReader out_br = new BufferedReader(new InputStreamReader(stdout));

      String line = null;
      //int x = 0;
      line = out_br.readLine();
      Logger.debug.println("[UtilBean:chkSWBKProcess] line  ==> " + line);
    }
    catch (IOException e) {
      System.out.println("[UtilBean] " + e.toString());
    }
    finally {
      try {
        stdout.close();
      }
      catch (IOException e) {
        System.out.println("[UtilBean] " + e.toString());
      }
    }
    return tLine.trim();
  }

  public static String getProcessFileName(String sGbn) {
    InputStream stdout = null;
    try {
      Process p = null;
      //String df = new String();
      String[] cmd = { "sh", "-c", "ps -ef | grep " + sGbn };
      p = Runtime.getRuntime().exec(cmd);
      stdout = p.getInputStream();
      BufferedReader out_br = new BufferedReader(new InputStreamReader(stdout));
      String line = null;
      String tLine = "";
      int x = 0;
      while ((line = out_br.readLine()) != null) {
        if (x == 0) {
          tLine += line;
        }
        x += 1;
      }

      int c = tLine.lastIndexOf("/");
      String temp = tLine.substring(c + 1);
      if (!temp.startsWith("sh")) {
        c = temp.lastIndexOf(".");
        return temp.substring(0, c) + ".dump";
      }
      else {
        return "";
      }
    }
    catch (Exception e) {
      return "";
    }
    finally {
      try {
        stdout.close();
      }
      catch (IOException e) {
        System.out.println("[UtilBean] getProcessFileName() : " + e.toString());
      }
    }
  }
*/

  public static Object[] clone(Object objects[]) {
    int length = objects.length;
    Class c = ((Object) (objects)).getClass().getComponentType();
    Object array = Array.newInstance(c, length);
    for (int i = 0; i < length; i++) {
      Array.set(array, i, clone(objects[i]));
    }
    return (Object[]) array;
  }

  public static Object clone(Object object) {
    Class c = object.getClass();
    Object newObject = null;
    try {
      newObject = c.newInstance();
    }
    catch (Exception _ex) {
      return null;
    }
    Field field[] = c.getFields();
    for (int i = 0; i < field.length; i++) {
      try {
        Object f = field[i].get(object);
        field[i].set(newObject, f);
      }
      catch (Exception _ex) {
      }
    }
    return newObject;
  }

  public static Vector clone(Vector objects) {
    Vector newObjects = new Vector();
    Object o;
    for (Enumeration e = objects.elements(); e.hasMoreElements(); newObjects.addElement(clone(o))) {
      o = e.nextElement();
    }
    return newObjects;
  }

  public static void fixNull(Object o) {
    if (o == null) {
      return;
    }
    Class c = o.getClass();
    if (c.isPrimitive()) {
      return;
    }
    Field fields[] = c.getFields();
    for (int i = 0; i < fields.length; i++) {
      try {
        Object f = fields[i].get(o);
        Class fc = fields[i].getType();
        if (fc.getName().equals("java.lang.String")) {
          if (f == null) {
            fields[i].set(o, "");
          }
          else {
            fields[i].set(o, f);
          }
        }
      }
      catch (Exception _ex) {
      }
    }
  }

  public static void fixNullAll(Object o) {
    if (o == null) {
      return;
    }
    Class c = o.getClass();
    if (c.isPrimitive()) {
      return;
    }
    if (c.isArray()) {
      int length = Array.getLength(o);
      for (int i = 0; i < length; i++) {
        Object element = Array.get(o, i);
        fixNullAll(element);
      }

    }
    else {
      Field fields[] = c.getFields();
      for (int i = 0; i < fields.length; i++) {
        try {
          Object f = fields[i].get(o);
          Class fc = fields[i].getType();
          if (!fc.isPrimitive()) {
            if (fc.getName().equals("java.lang.String")) {
              if (f == null) {
                fields[i].set(o, "");
              }
              else {
                fields[i].set(o, f);
              }
            }
            else if (f != null) {
              fixNullAll(f);
            }
          }
        }
        catch (Exception _ex) {
        }
      }
    }
  }

  public static void fixNullAndTrim(Object o) {
    if (o == null) {
      return;
    }
    Class c = o.getClass();
    if (c.isPrimitive()) {
      return;
    }
    Field fields[] = c.getFields();
    for (int i = 0; i < fields.length; i++) {
      try {
        Object f = fields[i].get(o);
        Class fc = fields[i].getType();
        if (fc.getName().equals("java.lang.String")) {
          if (f == null) {
            fields[i].set(o, "");
          }
          else {
            String item = trim((String) f);
            fields[i].set(o, item);
          }
        }
      }
      catch (Exception _ex) {
      }
    }
  }

  public static void fixNullAndTrimAll(Object o) {
    if (o == null) {
      return;
    }
    Class c = o.getClass();
    if (c.isPrimitive()) {
      return;
    }
    if (c.isArray()) {
      int length = Array.getLength(o);
      for (int i = 0; i < length; i++) {
        Object element = Array.get(o, i);
        fixNullAndTrimAll(element);
      }
    }
    else {
      Field fields[] = c.getFields();
      for (int i = 0; i < fields.length; i++) {
        try {
          Object f = fields[i].get(o);
          Class fc = fields[i].getType();
          if (!fc.isPrimitive()) {
            if (fc.getName().equals("java.lang.String")) {
              if (f == null) {
                fields[i].set(o, "");
              }
              else {
                String item = trim((String) f);
                fields[i].set(o, item);
              }
            }
            else if (f != null) {
              fixNullAndTrimAll(f);
            }
          }
        }
        catch (Exception _ex) {
        }
      }
    }
  }

  public static String getStackTrace(Throwable e) {
    ByteArrayOutputStream bos = new ByteArrayOutputStream();
    PrintWriter writer = new PrintWriter(bos);
    e.printStackTrace(writer);
    writer.flush();
    return bos.toString();
  }

  public static String toCharString(byte barray[]) {
    StringBuffer buf = new StringBuffer();
    boolean first = true;
    buf.append("[(length=" + barray.length + ")");
    for (int i = 0; i < barray.length; i++) {
      if (!first) {
        buf.append(" ");
      }
      else {
        first = false;
      }
      buf.append((char) barray[i]);
    }
    buf.append("]");
    return buf.toString();
  }

  public static String toHexString(byte barray[]) {
    StringBuffer buf = new StringBuffer();
    boolean first = true;
    buf.append("[(length=" + barray.length + ")");
    for (int i = 0; i < barray.length; i++) {
      if (!first) {
        buf.append(" ");
      }
      else {
        first = false;
      }
      String temp = Integer.toHexString(barray[i]);
      if (temp.length() == 8) {
        temp = temp.substring(6);
      }
      buf.append(temp);
    }
    buf.append("]");
    return buf.toString();
  }

  public static String toString(Object o) {
    StringBuffer buf = new StringBuffer();
    Class c = o.getClass();
    String fullname = c.getName();
    String name = null;
    int index = fullname.lastIndexOf(46);
    if (index == -1) {
      name = fullname;
    }
    else {
      name = fullname.substring(index + 1);
    }
    buf.append(name + ":{");
    Field fields[] = c.getFields();
    for (int i = 0; i < fields.length; i++) {
      try {
        if (i != 0) {
          buf.append(',');
        }
        buf.append(fields[i].getName() + '=');
        Object f = fields[i].get(o);
        Class fc = fields[i].getType();
        if (fc.isArray()) {
          buf.append('[');
          int length = Array.getLength(f);
          for (int j = 0; j < length; j++) {
            if (j != 0) {
              buf.append(',');
            }
            Object element = Array.get(f, j);
            buf.append(element.toString());
          }
          buf.append(']');
        }
        else {
          buf.append(f.toString());
        }
      }
      catch (Exception _ex) {
      }
    }
    buf.append('}');
    return buf.toString();
  }

  public static String trim(String s) {
    int st = 0;
    char val[] = s.toCharArray();
    int count = val.length;
    int len;
    for (len = count; (st < len) && ((val[st] <= ' ') || (val[st] == '\u3000')); st++) {
      ;
    }
    for (; (st < len) && ((val[len - 1] <= ' ') || (val[len - 1] == '\u3000')); len--) {
      ;
    }
    return (st <= 0) && (len >= count) ? s : s.substring(st, len);
  }

  public static void main(String[] args) {
    UtilBean utilBean1 = new UtilBean();
    try {
      /*
      Vector pagesVec = new Vector();
      pagesVec = utilBean1.getPage(64, 20);
      for (int i = 0; i < pagesVec.size(); i++) {
        Map asMap = (HashMap) pagesVec.elementAt(i);
        System.out.println("PAGE_NUMBER = " + asMap.get("PAGE_NUMBER"));
        System.out.println("PAGE_START = " + asMap.get("PAGE_START"));
      }
      */
      /*
      int[] money = {100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000};
      String moneystr = null;
      for (int i=0;i<money.length;i++){
        moneystr = utilBean1.getFormattedMoney(money[i]);
        System.out.println("money["+i+"] = " + moneystr);
      }
      */
      String a = chkProcess("java");
      System.out.println("[chkProcess         ] Process = " + a);
      a = chkSWBKProcess("java");
      System.out.println("[chkSWBKProcess     ] Process = " + a);
      a = getProcessFileName("java");
      System.out.println("[getProcessFileName ] File = " + a);
      a = getDBBackupFileName("java");
      System.out.println("[getDBBackupFileName] File = " + a);
    }
    catch (Exception e) {
      System.out.println(e.toString());
    }
  }
}
