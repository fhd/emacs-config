public class GWTTest {
    public native void displayName(String name) /*-{
        function flipName(name) {
            return name.replace(/(\w+)\s(\w+)/, '$2, $1');
        }
        window.alert(flipName(name));
    }-*/;
}