package cooperacaoSemaforo;

import java.util.concurrent.Semaphore;

/**
 * Similar a classe BufferWaitNotify porém usa Semáforo no lugar de wait/notify
 * @author sidneynogueira
 */
public class BufferSemaforo {

    private final char[] buf;
    private int tam;
    private final int MAX = 100;
    private final Semaphore semaforo;
    private final Semaphore semaforoAuxiliar;

    public BufferSemaforo() {
        semaforo = new Semaphore(0);//acquire/release
        semaforoAuxiliar = new Semaphore(1);
        buf = new char[MAX];
        tam = 0;
    }
    
    public synchronized void inserir(char c) {
        if (tam == MAX) {
            try {
                semaforo.release();
                semaforoAuxiliar.acquire();
            } catch (InterruptedException ie) {
            }
        } else {
            buf[tam++] = c;
        }
    }

    public String esvaziar() {//synchronize causaria deadlock
        try {
            semaforo.acquire();
            semaforoAuxiliar.release();
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
        }
        tam = 0;
        return new String(buf);
    }

}
