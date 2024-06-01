open Owl

type t

val from_matrix : Mat.mat -> t
val has_edge : t -> int -> int -> bool
val print_matrix : t -> unit
val print_dot : t -> unit
