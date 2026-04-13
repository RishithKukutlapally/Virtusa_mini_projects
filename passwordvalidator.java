import java.util.*;
public class passwordvalidator{
    public static void main(String [] args){
        Scanner sc=new Scanner(System.in);
        String pass;
        while(true){
            System.out.print("Enter the password:");
            pass=sc.next();
            boolean isupper=false;
            boolean isdigit=false;
            if(pass.length()<8){
                System.out.println("Password must have atleast 8 characters");

            }
            for(int i=0;i<pass.length();i++){
                char ch=pass.charAt(i);
                if(Character.isUpperCase(ch)){
                    isupper=true;
                }
                if(Character.isDigit(ch)){
                    isdigit=true;
                }

            }
            if(!isupper){
                System.out.println("Password must have atleast one uppercase letter");
            }
            if(!isdigit){
                System.out.println("Password must have atleast one digit");
            }

            if(isupper && isdigit && pass.length()>=8){
                System.out.println("Password is valid");
            }
        }
    }
}