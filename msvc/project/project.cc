// -*- mode: c++; fill-column: 80; c-basic-offset: 2; indent-tabs-mode: nil -*-
/*
    Copyright (c) 2010 Juan Jose Garcia Ripoll

    Tensor is free software; you can redistribute it and/or modify it
    under the terms of the GNU Library General Public License as published
    by the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Library General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/

#include <tensor/tensor.h>
#include <tensor/io.h>
#include <tensor/linalg.h>
#include <mps/quantum.h>

using namespace tensor;
using namespace linalg;

int
main(int argc, char **argv)
{

  /* Create a Hamiltonian for two spins */
  double field = 0.3;
  CTensor H = kron(mps::Pauli_z, mps::Pauli_z) +
    field * (kron(mps::Pauli_x, mps::Pauli_id) +
	     kron(mps::Pauli_id, mps::Pauli_x));

  RTensor eigenvector;
  RTensor E = eigs(real(H), SmallestReal, 1, &eigenvector);

  std::cout << "Solving Ising model with two spins and field = "
	    << field << std::endl
	    << "energy = " << E[1] << std::endl
	    << "vector =\n" << matrix_form(eigenvector) << std::endl
	    << "H=\n" << matrix_form(H) << std::endl;
}
