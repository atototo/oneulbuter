package com.ko.diet.common.Util;
import java.util.StringTokenizer;

public class StringSeparator {

  /**
   * breaks a string into tokens by delimiter characters and returns tokens in an array.
   * 
   * @param String
   *          a sentence which should be broken String a delimiter character
   * @return String[] tokens which was a sentence before seperated
   */
  public String[] doSeparator(String sentence, String sep_key) {
    StringTokenizer st = new StringTokenizer(sentence, sep_key);
    String[] rtn_array = new String[st.countTokens()];
    for (int i = 0; i < rtn_array.length; i++) {
      rtn_array[i] = st.nextElement().toString();
    }
    return rtn_array;
  }

  /**
   * gets the rest of the sentence after the character, ":", and before the character, ";".
   * 
   * @param String
   *          a sentence
   * @return String
   */
  public String colonSep(String allcmd) {
    return allcmd.substring(allcmd.indexOf(":") + 1, allcmd.indexOf(";"));
  }

  /**
   * gets the part of the sentence before the character, "=".
   * 
   * @param String
   *          a sentence including equal character
   * @return String
   */
  public String beforeEqual(String key_val) {
    return key_val.substring(0, key_val.indexOf("="));
  }

  /**
   * gets the part of the sentence after the character, "=".
   * 
   * @param String
   *          a sentence including equal character
   * @return String
   */
  public String afterEqual(String key_val) {
    String rtnStr = "";
    if (key_val.indexOf("=") != -1) {
      rtnStr = key_val.substring(key_val.indexOf("=") + 1);
      if (rtnStr.indexOf(",") != -1) {
        rtnStr = key_val.substring(key_val.indexOf("=") + 1, key_val.indexOf(","));
      }
    }
    return rtnStr;
  }

  /**
   * returns a command word from a MMC sentence.<br>
   * The command may need a mandatory keyword or a option keyword.
   * 
   * @param String
   *          a MMC sentence
   * @return String[] a command
   */
  public String[] doCMDSeparator(String allcmd) { 
    String[] rtn_array;
    String key = colonSep(allcmd);
    String[] key_val = doSeparator(key, " "); 
    rtn_array = new String[key_val.length]; 
    for (int i = 0; i < rtn_array.length; i++) { 
      rtn_array[i] = afterEqual(key_val[i]);
    }
    return rtn_array;
  }

  /**
   * returns a mandatory keyword from a MMC sentence.
   * 
   * @param String
   *          a MMC sentence
   * @return String[] a mandatory keyword
   */
  public String[] doMandatoryVals(String allcmd, String[] mandatory_key) { 
    String[] rtn_array = new String[mandatory_key.length];
    String key = colonSep(allcmd);
    String[] key_val = doSeparator(key, " ");
    String tmp_val1 = "";
    String tmp_val2 = "";
    for (int i = 0; i < mandatory_key.length; i++) {
      tmp_val1 = beforeEqual(key_val[i]);
      tmp_val2 = afterEqual(key_val[i]);
      if (tmp_val1.equals(mandatory_key[i])) {
        rtn_array[i] = tmp_val2;
      }
    }
    return rtn_array;
  }

  /**
   * returns a optional keyword from a MMC sentence.
   * 
   * @param String
   *          a MMC sentence
   * @return String[] a optional keyword
   */
  public String[] doOptionVals(String allcmd, String[] option_key) { 
    String[] rtn_array = new String[option_key.length];
    String key = colonSep(allcmd); 
    String[] key_val = doSeparator(key, " "); 
    String tmp_val1 = "";
    String tmp_val2 = "";
    for (int i = 0; i < option_key.length; i++) {
      for (int j = 0; j < key_val.length; j++) {
        tmp_val1 = beforeEqual(key_val[j]);
        tmp_val2 = afterEqual(key_val[j]);
        if (option_key[i].equals(tmp_val1)) {
          rtn_array[i] = tmp_val2;
        }
      }
    }
    return rtn_array;
  }

  /**
   * returns an empty array when there is not a optional keyword from a MMC sentence.
   * 
   * @param String
   *          a MMC sentence
   * @return String[] a optional keyword
   */
  public String[] doOptionVals2(String allcmd, String[] option_key) { 
    String[] rtn_array = new String[1];
    return rtn_array;
  }

  /**
   * Class constructor.
   */
  public StringSeparator() {
  }
}
