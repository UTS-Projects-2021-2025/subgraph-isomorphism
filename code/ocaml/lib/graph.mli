open Owl

type t

val from_matrix : Mat.mat -> t
val has_edge : t -> int -> int -> bool
val print_matrix : t -> unit
val print_dot : t -> unit
val has_edge : t -> int -> int -> bool
val print_matrix : t -> unit
val graph_congruence : t -> Mat.mat -> t
val subgraph_congruence : t -> Mat.mat -> Mat.mat -> t
val random_subgraph_congruence : t -> int -> t

(*  val print_dot : t -> unit ;; *)
