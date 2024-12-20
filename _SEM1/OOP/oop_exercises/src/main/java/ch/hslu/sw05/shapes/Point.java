package ch.hslu.sw05.shapes;

/**
 * Point in a 2-dimensional space
 */
public final class Point {
    private int x;
    private int y;

    /**
     * Constructor for point with coordinates.
     * 
     * @param x x-Koordinate.
     * @param y y-Koordinate.
     */
    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public Point(Point point) {
        new Point(point.getX(), point.getY());
    }

    /**
     * Returns the quadrant based of current position
     * 
     * @return Number of quadrant.
     */
    public Quadrant getQuadrant1() {
        if (this.x == 0 && this.y == 0)
            return Quadrant.NO_QUADRANT;

        if (this.x * this.y > 0) {
            if (this.x > 0) {
                return Quadrant.QUADRANT_1;
            } else {
                return Quadrant.QUADRANT_3;
            }
        } else {
            if (this.x > 0) {
                return Quadrant.QUADRANT_2;
            } else {
                return Quadrant.QUADRANT_4;
            }
        }
    }

    public void moveRelative(int x, int y) {
        this.x += x;
        this.y += y;
    }

    /**
     * Move point based on another points location interpreted as a vector
     * 
     * @param point
     */
    public void moveRelative(Point point) {
        // this.x += point.getX();
        // this.y += point.getY();
        this.moveRelative(point.getX(), point.getY());
    }

    /**
     *
     * @param angle  angle in degrees relative to the x-axis
     * @param length absolute length of vector
     */
    public void moveRelative(double angle, int length) {
        int delta_x = (int) (Math.cos(angle) * length);
        int delta_y = (int) (Math.sin(angle) * length);

        // this.x += delta_x;
        // this.y += delta_y;
        this.moveRelative(delta_x, delta_y);
    }

    /**
     * Returns x-coordinate.
     * 
     * @return x-coordinate of point.
     */
    public int getX() {
        return this.x;
    }

    /**
     * Returns x-coordinate.
     * 
     * @return x-coordinate of point.
     */
    public int getY() {
        return y;
    }

    /**
     * Returns a string representation of point.
     */
    @Override
    public String toString() {
        return "Point[x=" + this.x + ",y=" + this.y + "]";
    }

}
