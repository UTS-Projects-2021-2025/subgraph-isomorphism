open Owl ;;

val random_permutation_matrix : int -> Mat.mat ;;

val permute_adj_matrix : Mat.mat -> Mat.mat -> Mat.mat ;;

val common_edges : Mat.mat -> Mat.mat -> Mat.mat ;;

val common_edges_count : Mat.mat -> Mat.mat -> float ;;
