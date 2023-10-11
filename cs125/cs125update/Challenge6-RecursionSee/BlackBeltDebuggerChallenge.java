//UIUC CS125 FALL 2013 MP. File: BlackBeltDebuggerChallenge.java, CS125 Project: Challenge6-RecursionSee, Version: 2013-11-05T17:24:16-0600.569335634
/**
 * This class tests your Debugger Fu. Use Debug As > Unit Test on the Test
 * class. You'll need to set breakpoints and single step through the code.
 * @author replace-with-your-pliu15-here
 *
 */

public class BlackBeltDebuggerChallenge {

    /**
     * Use the Debugger's breakpoints, and the debugger controls to discover the
     * character you need here to make the test pass.
     * 
     * @return the secret character
     */
    private static String getNetId() {
        return "pliu15";
    }
    private static int getUniqueValue() {
        String netId = getNetId();
        netId = netId.trim().toUpperCase();
        if (netId.length() == 0 || netId.length() > 10)
            throw new RuntimeException("Invalid NetID");

        int result = 0xBAADF00D;
        for (int i = 0; i < netId.length(); i++) {
            char c = netId.charAt(i);
            boolean ok = Character.isDigit(c) || (c >= 'A' && c <= 'Z')
                    || c == '-';
            if (!ok)
                throw new RuntimeException("Invalid NetID:" + c);
            result = (int) (2654435761L * result) ^ c; // Knuth's simple hash
        }
        return result;
    }
    public int recursion(int level) {
        if (level > 6)
            return 1;
        return recursion(level + 1);
    }
    public static char getTrial0Secret() {
        int unique = getUniqueValue();
        char required = 'a';
        required += 1 + (unique & 7);

        // Warning - the value you need here is specific to you
        return required;
    }

    /**
     * Use the Debugger's breakpoints, and the debugger controls to discover the
     * character you need here to make the test pass.
     * 
     * @return the secret character
     */
    public static char getTrial1Secret() {
        // Warning - the value you need here is specific to you
        return 'w';
    }

    /**
     * Use the Debugger's breakpoints, and the debugger controls to discover the
     * character you need here to make the test pass.
     * 
     * @return the secret character
     */
    public static char getTrial2Secret() {
        int unique = getUniqueValue();
        char required = 'A';
        int levels = 2 + ((unique >> 2) & 7);
        required += levels * 2;
        // Warning - the value you need here is specific to you
        return required;
    }

    /**
     * Use the Debugger's breakpoints, and the debugger controls to discover the
     * character you need here to make the test pass.
     * 
     * @return the secret character
     */
    private static void smurf(int check) {
        TextIO.putln(check);
        if (check != 9)
            throw new RuntimeException(
                    "The Ninja crushes your futile debugging attempts");

    }
    public static char getTrial3Secret() {
        char required = '	';
        return required;
    }
}