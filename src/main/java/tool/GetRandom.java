package tool;

import java.util.Random;

public class GetRandom {
	//x부터 y까지의 숫자에 1을 더해 1부터 10까지
    public static String stringNumber(int x,int y) {
        Random random = new Random();
        int randomNumber = random.nextInt(y - x + 1) + x;
        return Integer.toString(randomNumber);
    }
}
