import java.lang {
    ObjectArray,
    IntArray
}
import java.util {
    Arrays,
    Collections,
    ArrayList,
    HashMap,
    TreeMap
}


shared void egArray() {

    value words = ObjectArray(4, "hello");

    words[1] = "world";
    words[2] = "goodbye";
    words[3] = "!";

    for (word in words) {
        print(word);
    }

    for (i in 0:words.size) {
        words[i] = words[i]?.uppercased;
    }

    for (word in words) {
        print(word);
    }

    value lengths = IntArray(words.size);
    for (i in 0:words.size) {
        assert (exists word = words[i]);
        lengths[i] = word.size;
    }

    for (length in lengths) {
        print(length);
    }

    Arrays.sort<String>(words,
        (x, y) => x.size - y.size);

    print(Arrays.toString(words));
    print(Arrays.toString(lengths));

}

shared void egList() {

    value words = Arrays.asList("hello", "world");

    for (word in words) {
        print(word);
    }

    words.forEach(print);

    for (i in 0:words.size()) {
        print(words[i]);
    }

    print("hello" in words);
    print("goodbye" in words);

    value cubes = Arrays.asList(for (i in 0..10) i^3);
    value evenCubes = Arrays.asList(for (n in cubes) if (2.divides(n)) n);

    printAll { *cubes };
    printAll { *evenCubes };

}

shared void egArrayList() {

    value words = ArrayList<String>();
    words.add("hello");
    words.add("world");
    words.add("goodbye");

    print(words);

    words[0] = "hi";
    words[2] = "bye";

    Collections.sort<String>(words,
        (x, y) => x.size - y.size);

    print(words);

}

shared void egHashMap() {

    value chars = HashMap<Character,Integer>();
    for (char in "hello world!") {
        chars.put(char.uppercased, char.integer);
    }

    print(chars);

    for (char in "HELLO EVERYONE") {
        print(chars[char]);
    }

    value sortedChars
            = TreeMap<Character,Integer>
                ((x, y) => x.integer - y.integer);
    sortedChars.putAll(chars);

    print(sortedChars);

}