open Owl
open Base

type t = Mat.mat

let from_matrix m = m

let has_edge g i j =
    Mat.get g i j |> Float.equal 1.0

let print_matrix g =
    Mat.print g
