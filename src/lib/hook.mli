(**************************************************************************)
(*                                                                        *)
(*  This file is part of Frama-C.                                         *)
(*                                                                        *)
(*  Copyright (C) 2007-2012                                               *)
(*    CEA (Commissariat � l'�nergie atomique et aux �nergies              *)
(*         alternatives)                                                  *)
(*                                                                        *)
(*  you can redistribute it and/or modify it under the terms of the GNU   *)
(*  Lesser General Public License as published by the Free Software       *)
(*  Foundation, version 2.1.                                              *)
(*                                                                        *)
(*  It is distributed in the hope that it will be useful,                 *)
(*  but WITHOUT ANY WARRANTY; without even the implied warranty of        *)
(*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *)
(*  GNU Lesser General Public License for more details.                   *)
(*                                                                        *)
(*  See the GNU Lesser General Public License version 2.1                 *)
(*  for more details (enclosed in the file licenses/LGPLv2.1).            *)
(*                                                                        *)
(**************************************************************************)

(** Hook builder. A hook is a bunch of functions which can be extended and
    applied at any program point. *)

(** Output signature. *)
module type S = sig

  type param
    (** Type of the parameter of the functions registered in the hook. *)

  type result
    (** Type of the result of the functions.
        result can be unit (for iterative hooks) or param (for folding hooks)
     *)

  val extend: (param -> result) -> unit
    (** Add a new function to the hook. If [once] is true, the hook
        is added if and only if it was not already present. Comparison
        is done using [(==)]. Default is false. *)

  val extend_once: (param -> result) -> unit
    (** Same as [extend], but the hook is added only if is is not already
        present; the comparison is made using [(==)]

        @since Oxygen-20120901
    *)


  val apply: param -> result
    (** Apply all the functions of the hook on the given parameter.
        These functions are applied from the least recently entered to the most
        recently entered.*)

  val is_empty: unit -> bool
    (** Is no function already registered in the hook? *)

  val clear: unit -> unit
    (** Clear the hook. *)

  val length: unit -> int
    (** Number of registered functions. *)

end

module type Iter_hook = S with type result = unit

(** Make a new empty hook from a given type of parameters. *)
module Build(P:sig type t end) : Iter_hook with type param = P.t

(** Make a new empty hook from [unit]. *)
module Make(X:sig end) : S with type param = unit and type result = unit

module Fold(P: sig type t end): S with type param = P.t and type result = P.t

(*
Local Variables:
compile-command: "make -C ../.."
End:
*)