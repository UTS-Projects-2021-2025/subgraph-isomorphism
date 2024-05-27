open Owl ;;

type t ;;

val random_permutation : int -> t ;;

val into_permutation_matrix : t -> Mat.mat ;;

val random_permutation_matrix : int -> Mat.mat ;;

val print_permutation : t -> unit ;;
