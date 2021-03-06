import java.util.stream {
    Collectors {
        toList,
        toMap
    },
    Stream {
        with=\iof
    },
    LongStream
}

shared void egStream() {

    value string =
            Stream
                .with("hello", "world", "goodbye")
                .filter((str) => !"good" in str)
                .map(String.uppercased)
                .reduce("", (x, y) => x + " " + y);

    print(string);
}

shared void egUnionConcatenatedStream() {

    value text = "hi hello world goodbye bye";

    Stream
        .concat(Stream.with(*text.split()),
                Stream.iterate(1, 2.times))
        .parallel()
        .filter((x)
            => switch (x)
            case (is String) x.longerThan(4)
            case (is Integer) x>4)
        .limit(10)
        .forEachOrdered(print);
}

shared void egParallelStreamToMap() {

    value text = "hello, world, goodbye, everyone, blahblahblahblahblahblah";

    value map =
            Stream
                .with(*text.split(','.equals))
                .parallel()
                .map(String.trimmed)
                .filter((str) => str.shorterThan(10))
                .collect(toMap(String.string, String.size));

    map.entrySet()
        .parallelStream()
        .forEach(print);

}

shared void egLongStreamToList() {

    value evenCubes =
            LongStream
                .iterate(1, (x) => x+1) //or Integer.successor
                .parallel()
                .map((i) => i^3)
                .filter(2.divides)
                .mapToObj((i) => i) //or identity<Integer>
                .limit(20)
                .collect(toList<Integer>());

    evenCubes.forEach(print);
}