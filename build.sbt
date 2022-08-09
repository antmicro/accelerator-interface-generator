name := "generic-accelerator-interface"

version := "3.5.3"

scalaVersion := "2.12.13"

scalacOptions ++= Seq(
  "-deprecation",
  "-feature",
  "-unchecked",
  "-Xfatal-warnings",
  "-language:reflectiveCalls"
)

fork := true
javaOptions ++= Seq(
  "-XX:+UseG1GC",
  "-Xmx16G"
)

Compile / unmanagedSourceDirectories += baseDirectory.value / "src" / "fastvdma-chisel" / "src" / "main"
Compile / resourceDirectory := baseDirectory.value / "examples" / "resources"
Test / resourceDirectory := baseDirectory.value / "examples" / "resources"

// Chisel 3.5
addCompilerPlugin(
  "edu.berkeley.cs" % "chisel3-plugin" % "3.5.3" cross CrossVersion.full
)

// Provide a managed dependency on X if -DXVersion="" is supplied on the command line.
val defaultVersions = Map(
  "chisel3" -> "3.5.+",
  "chiseltest" -> "0.5.3+"
)

libraryDependencies ++= Seq("chisel3", "chiseltest").map { dep: String =>
  "edu.berkeley.cs" %% dep % sys.props.getOrElse(
    dep + "Version",
    defaultVersions(dep)
  )
}

libraryDependencies += "com.typesafe.play" %% "play-json" % "2.8.+"
