package SW2;

class Main{
    public static void main(String[] args){
        try{
            Temperature t = new Temperature(20, "celcius");
            t.setKelvin(5);
            System.out.println(t.getKelvin());
        } catch (Exception e){
            System.out.println(e);
        }
    }
}