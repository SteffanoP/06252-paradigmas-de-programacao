
import java.util.ArrayList;
import java.util.Collection;

/**
 *
 * @author SteffanoP <steffanoxpereira@gmail.com>
 */
public class MeuMapeamentoSteffanoPereira<C,V> implements IMeuMapeamento<C,V> {
    protected ArrayList<C> chaves;
    protected ArrayList<V> valores;

    public MeuMapeamentoSteffanoPereira() {
        this.chaves = new ArrayList<>();
        this.valores = new ArrayList<>();
    }

    @Override
    public void insere(C chave, V valor) {
        if (this.chaves.contains(chave)) {
            int index = this.chaves.indexOf(chave);
            this.valores.set(index, valor);
        } else {
            this.chaves.add(chave);
            this.valores.add(valor);
        }
    }

    @Override
    public V valor(C chave) {
        if (this.chaves.contains(chave)) {
            int index = this.chaves.indexOf(chave);
            return this.valores.get(index);
        }
        return null;
    }

    @Override
    public Collection<V> valores() {
        return this.valores;
    }

    @Override
    public Collection<C> chaves() {
        return this.chaves;
    }

   
}
