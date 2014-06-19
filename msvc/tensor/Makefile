srcdir=..\..\tensor
includedir=..\include\tensor

CXX=cl
LINK=link
CPPFLAGS=/I. /I..\include
CXXFLAGS=/O2 /nologo /EHsc

headers= \
	$(includedir)\arpack.h \
	$(includedir)\arpack_d.h \
	$(includedir)\arpack_z.h \
	$(includedir)\detail\common.h \
	$(includedir)\detail\functional.h \
	$(includedir)\detail\io.hpp \
	$(includedir)\detail\refcount.hpp \
	$(includedir)\detail\sparse_base.hpp \
	$(includedir)\detail\sparse_kron.hpp \
	$(includedir)\detail\sparse_ops.hpp \
	$(includedir)\detail\tensor_base.hpp \
	$(includedir)\detail\tensor_kron.hpp \
	$(includedir)\detail\tensor_matrix.hpp \
	$(includedir)\detail\tensor_ops.hpp \
	$(includedir)\detail\tensor_reshape.hpp \
	$(includedir)\detail\tensor_slice.hpp \
	$(includedir)\gen.h \
	$(includedir)\indices.h \
	$(includedir)\io.h \
	$(includedir)\jobs.h \
	$(includedir)\linalg.h \
	$(includedir)\numbers.h \
	$(includedir)\rand.h \
	$(includedir)\refcount.h \
	$(includedir)\sdf.h \
	$(includedir)\sparse.h \
	$(includedir)\tensor.h \
	$(includedir)\tensor_blas.h \
	$(includedir)\tensor_lapack.h \
	$(includedir)\tools.h \
	$(includedir)\vector.h \
	$(includedir)\fftw.h \
	$(includedir)\config.h

tensor_objs=\
	tools\tictoc.obj \
	tools\backtrace.obj \
	tools\jobs.obj \
	tools\jobs_save.obj \
	tools\jobs_dataset.obj \
	rand\rand.obj \
	indices\indices.obj \
	indices\concat.obj \
	indices\linspace_d.obj \
	indices\linspace_z.obj \
	indices\booleans.obj \
	indices\booleans_and.obj \
	indices\booleans_or.obj \
	indices\booleans_not.obj \
	indices\which.obj \
	indices\surrounding_dimensions.obj \
	sparse\full_d.obj \
	sparse\full_z.obj \
	sparse\sparse_d.obj \
	sparse\sparse_z.obj \
	sparse\sparse_d_to_z.obj \
	sparse\sparse_kron_d.obj \
	sparse\sparse_kron_z.obj \
	sparse\sparse_ops_d.obj \
	sparse\sparse_ops_z.obj \
	sparse\sparse_real.obj \
	sparse\sparse_imag.obj \
	sparse\sparse_conj.obj \
	sparse\mmult_sparse_tensor_d.obj \
	sparse\mmult_sparse_tensor_z.obj \
	sparse\mmult_tensor_sparse_d.obj \
	sparse\mmult_tensor_sparse_z.obj \
	tensor\tensor_common.obj \
	tensor\tensor_d.obj \
	tensor\tensor_z.obj \
	tensor\tensor_to_complex.obj \
	tensor\tensor_conj.obj \
	tensor\tensor_imag_d.obj \
	tensor\tensor_real_z.obj \
	tensor\tensor_imag_z.obj \
	tensor\matrix_norminf_d.obj \
	tensor\matrix_norminf_z.obj \
	tensor\matrix_adjoint_z.obj \
	tensor\matrix_diag_d.obj \
	tensor\matrix_diag_z.obj \
	tensor\matrix_trace_d.obj \
	tensor\matrix_trace_z.obj \
	tensor\tensor_trace_d.obj \
	tensor\tensor_trace_z.obj \
	tensor\matrix_transpose_d.obj \
	tensor\matrix_transpose_z.obj \
	tensor\tensor_permute_d.obj \
	tensor\tensor_permute_z.obj \
	tensor\tensor_fold_d.obj \
	tensor\tensor_fold_z.obj \
	tensor\tensor_fold_dz.obj \
	tensor\tensor_foldin_d.obj \
	tensor\tensor_foldin_z.obj \
	tensor\tensor_kron_d.obj \
	tensor\tensor_kron_z.obj \
	tensor\tensor_round_d.obj \
	tensor\tensor_sum_d.obj \
	tensor\tensor_sum_z.obj \
	tensor\tensor_mean_d.obj \
	tensor\tensor_mean_z.obj \
	tensor\tensor_mean_ndx_d.obj \
	tensor\tensor_mean_ndx_z.obj \
	tensor\tensor_norm0_d.obj \
	tensor\tensor_norm0_z.obj \
	tensor\tensor_norm2_d.obj \
	tensor\tensor_norm2_z.obj \
	tensor\tensor_scale_d.obj \
	tensor\tensor_scale_z.obj \
	tensor\tensor_sort_d.obj \
	tensor\tensor_reshape_d.obj \
	tensor\tensor_reshape_z.obj \
	tensor\tensor_squeeze.obj \
	tensor\tensor_squeeze_d.obj \
	tensor\tensor_squeeze_z.obj \
	tensor\tensor_take_diag_d.obj \
	tensor\tensor_take_diag_z.obj \
	tensor\tensor_change_dimension_d.obj \
	tensor\tensor_change_dimension_z.obj \
	compare\rtensor_rtensor_all_equal.obj \
	compare\rtensor_double_all_equal.obj \
	compare\rtensor_rtensor_e.obj \
	compare\rtensor_rtensor_l.obj \
	compare\rtensor_rtensor_g.obj \
	compare\rtensor_rtensor_le.obj \
	compare\rtensor_rtensor_ge.obj \
	compare\rtensor_rtensor_ne.obj \
	compare\rtensor_double_e.obj \
	compare\rtensor_double_l.obj \
	compare\rtensor_double_g.obj \
	compare\rtensor_double_le.obj \
	compare\rtensor_double_ge.obj \
	compare\rtensor_double_ne.obj \
	compare\ctensor_ctensor_all_equal.obj \
	compare\ctensor_cdouble_all_equal.obj \
	compare\ctensor_ctensor_e.obj \
	compare\ctensor_ctensor_ne.obj \
	compare\ctensor_cdouble_e.obj \
	compare\ctensor_cdouble_ne.obj \
	compare\indices_indices_e.obj \
	compare\indices_indices_l.obj \
	compare\indices_indices_g.obj \
	compare\indices_indices_le.obj \
	compare\indices_indices_ge.obj \
	compare\indices_indices_ne.obj \
	compare\indices_index_e.obj \
	compare\indices_index_l.obj \
	compare\indices_index_g.obj \
	compare\indices_index_le.obj \
	compare\indices_index_ge.obj \
	compare\indices_index_ne.obj \
	generated\tensor_unop_abs_d.obj \
	generated\tensor_unop_sqrt_d.obj \
	generated\tensor_unop_exp_d.obj \
	generated\tensor_unop_cos_d.obj \
	generated\tensor_unop_sin_d.obj \
	generated\tensor_unop_tan_d.obj \
	generated\tensor_unop_cosh_d.obj \
	generated\tensor_unop_sinh_d.obj \
	generated\tensor_unop_tanh_d.obj \
	generated\tensor_unop_abs_z.obj \
	generated\tensor_unop_cos_z.obj \
	generated\tensor_unop_sin_z.obj \
	generated\tensor_unop_tan_z.obj \
	generated\tensor_unop_cosh_z.obj \
	generated\tensor_unop_sinh_z.obj \
	generated\tensor_unop_tanh_z.obj \
	generated\tensor_unop_exp_z.obj \
	generated\tensor_unop_sqrt_z.obj \
	linalg\eig_d.obj \
	linalg\eig_z.obj \
	linalg\svd_d.obj \
	linalg\svd_z.obj \
	linalg\solve_d.obj \
	linalg\solve_z.obj \
	linalg\solve_with_svd_d.obj \
	linalg\solve_with_svd_z.obj \
	linalg\expm_d.obj \
	linalg\expm_z.obj \
	linalg\eig_power_d.obj \
	linalg\eig_power_z.obj \
	linalg\eig_sym_d.obj \
	linalg\eig_sym_z.obj \
	views\range.obj \
	views\matrix_form_d.obj \
	views\matrix_form_z.obj \
	views\matrix_form_sp_d.obj \
	views\matrix_form_sp_z.obj \
	sdf\data_file.obj \
	sdf\idata_file.obj \
	sdf\odata_file.obj \
	sdf\isdir.obj \
	sdf\make_directory.obj \
	sdf\file_exists.obj \
	sdf\delete_file.obj \
	sdf\rename_file.obj

TARGETS=..\lib\tensor.lib

.SUFFIXES: .cc .obj

$(tensor_objs): ..\include\tensor\config.h
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) /c /Fo$@ $(srcdir)/src/$(@:.obj=.cc)

all: $(TARGETS)

$(headers): $(srcdir)\include\tensor\*
	-md ..\include\tensor
	-md arpack compare fftw indices linalg rand sdf sparse tensor tools views
	xcopy /y /s $(srcdir)\include\tensor ..\include\tensor
	copy config.h $(includedir)

..\lib\tensor.lib: $(tensor_objs)
	$(LINK) -out:$@ $(tensor_objs)

clean:
	-for %f in ($(TARGETS)) do if exist %f del %f
	-for %f in (arpack compare fftw indices linalg rand sdf sparse tensor tools views $(includedir)) do if exist %f rd /s /q %f
