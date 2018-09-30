import org.apache.log4j.Logger
import org.apache.log4j.Level

Logger.getLogger("org").setLevel(Level.ERROR)
Logger.getLogger("akka").setLevel(Level.ERROR)

import org.apache.spark.graphx._
import org.apache.spark.rdd._
import scala.io.Source

//Building a graph

Source.fromFile("./EOADATA/metro.csv").getLines().take(5).foreach(println)
Source.fromFile("./EOADATA/country.csv").getLines().take(5).foreach(println)
Source.fromFile("./EOADATA/metro_country.csv").getLines().take(5).foreach(println)

class PlaceNode(val name: String) extends Serializable
case class Metro(override val name: String, population: Int) extends PlaceNode(name)

val metros: RDD[(VertexId, PlaceNode)] =
  sc.textFile("./EOADATA/metro.csv").
    filter(! _.startsWith("#")).
    map {line =>
      val row = line split ','
      (0L + row(0).toInt, Metro(row(1), row(2).toInt))
    }
	
val countries: RDD[(VertexId, PlaceNode)] =
  sc.textFile("./EOADATA/country.csv").
    filter(! _.startsWith("#")).
    map {line =>
      val row = line split ','
      (100L + row(0).toInt, Country(row(1)))
    }

val nodes = metros ++ countries
val metrosGraph = Graph(nodes, mclinks)
metrosGraph.vertices.take(5)
metrosGraph.edges.take(5)

metrosGraph.edges.filter(_.srcId == 1).map(_.dstId).collect()
metrosGraph.edges.filter(_.dstId == 103).map(_.srcId).collect()

metrosGraph.numEdges
metrosGraph.numVertices

def max(a: (VertexId, Int), b: (VertexId, Int)): (VertexId, Int) = {
  if (a._2 > b._2) a else b
}

ef min(a: (VertexId, Int), b: (VertexId, Int)): (VertexId, Int) = {
  if (a._2 <= b._2) a else b
}

metrosGraph.outDegrees.reduce(max)
metrosGraph.vertices.filter(_._1 == 5).collect()

metrosGraph.inDegrees.reduce(max)
metrosGraph.vertices.filter(_._1 == 108).collect()

metrosGraph.outDegrees.filter(_._2 <= 1).count

metrosGraph.degrees.reduce(max)
metrosGraph.degrees.reduce(min)