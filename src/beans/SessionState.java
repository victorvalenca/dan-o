package beans;

public class SessionState {
    private static String email;
    private static String password; 
  
    public static String getEmail() {
        return email;
    }

    public static void setEmail(String em) {
        email = em;
    }

    public static String getPassword() {
        return password;
    }

    public static void setPassword(String pass) {
        password = pass;
    }
  
}
