package diningphilosophers;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.*;

public class ChopStick extends ReentrantLock {

    private static int stickCount = 0;
    private final int myNumber;

    public ChopStick() {
        super();
        myNumber = ++stickCount;
    }

    public boolean tryTake(int delay) throws InterruptedException {
        return tryLock(delay, TimeUnit.MILLISECONDS);
    }

    public void release() {
            unlock();
    }

    @Override
    public String toString() {
        return "Stick#" + myNumber;
    }
}
