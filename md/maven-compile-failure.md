


I had the same problem and this is how I suggest you fix it:

Run:


    mvn dependency:list

and read carefully if there are any warning messages indicating that for some dependencies there will be no transitive dependencies available.

If yes, re-run it with -X flag:


    mvn dependency:list -X

to see detailed info what is maven complaining about (there might be a lot of output for -X flag)

In my case there was a problem in dependent maven module pom.xml - with managed dependency. Although there was a version for the managed dependency defined in parent pom, Maven was unable to resolve it and was complaining about missing version in the dependent pom.xml

So I just configured the missing version and the problem disappeared.

