
import java.util.Collection;

/**
 *
 * @author SteffanoP <steffanoxpereira@gmail.com>
 * @param <C> Tipo para a chave
 * @param <V> Tipo para o valor
 */
public interface IMeuMapeamento<C, V> {

    /**
     * Insere o par valor/chave no mapeamento. Se chave existe, o valor
     * associado é atualizado com o valor fornecido.
     *
     * @param chave A chave
     * @param valor O valor
     */
    void insere(C chave, V valor);

    /**
     * Retorna o valor associado a chave.
     *
     * @param chave Chave cujo valor será retornado.
     * @return Valor associado a chave, null se chave não existir.
     */
    V valor(C chave);


    /**
     * Retorna os valores do mapeamento.
     *
     * @return Os valores do mapeamento.
     */
    Collection<V> valores();

    /**
     * Retorna as chaves do mapeamento.
     *
     * @return As chaves do mapeamento.
     */
    Collection<C> chaves();

}
