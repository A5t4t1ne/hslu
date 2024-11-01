package ch.hslu.sw06.switchables;

/**
 * Interface for naming objects.
 */
public interface Named {
    /**
     * Set name
     * @param name new name
     */
    void setName(String name);

    /**
     * Returns name
     * @return current name
     */
    String getName();
}
