srcdir=../../f2c

CC=cl
LINK=link

f2c_objs = \
	obj\main.obj \
	obj\init.obj \
	obj\gram.obj \
	obj\lex.obj \
	obj\proc.obj \
	obj\equiv.obj \
	obj\data.obj \
	obj\format.obj \
	obj\expr.obj \
	obj\exec.obj \
	obj\intr.obj \
	obj\io.obj \
	obj\misc.obj \
	obj\error.obj \
	obj\mem.obj \
	obj\names.obj \
	obj\output.obj \
	obj\p1output.obj \
	obj\pread.obj \
	obj\put.obj \
	obj\putpcc.obj \
	obj\vax.obj \
	obj\formatdata.obj \
	obj\parse_args.obj \
	obj\niceprintf.obj \
	obj\cds.obj \
	obj\sysdep.obj \
	obj\version.obj

F77_files = \
	lib\f77_aloc.obj \
	lib\abort_.obj \
	lib\c_abs.obj \
	lib\c_cos.obj \
	lib\c_div.obj \
	lib\c_exp.obj \
	lib\c_log.obj \
	lib\c_sin.obj \
	lib\c_sqrt.obj \
	lib\d_abs.obj \
	lib\d_acos.obj \
	lib\d_asin.obj \
	lib\d_atan.obj \
	lib\d_atn2.obj \
	lib\d_cnjg.obj \
	lib\d_cos.obj \
	lib\d_cosh.obj \
	lib\d_dim.obj \
	lib\d_exp.obj \
	lib\d_imag.obj \
	lib\d_int.obj \
	lib\d_lg10.obj \
	lib\d_log.obj \
	lib\d_mod.obj \
	lib\d_nint.obj \
	lib\d_prod.obj \
	lib\d_sign.obj \
	lib\d_sin.obj \
	lib\d_sinh.obj \
	lib\d_sqrt.obj \
	lib\d_tan.obj \
	lib\d_tanh.obj \
	lib\derf_.obj \
	lib\derfc_.obj \
	lib\dtime_.obj \
	lib\ef1asc_.obj \
	lib\ef1cmc_.obj \
	lib\erf_.obj \
	lib\erfc_.obj \
	lib\etime_.obj \
	lib\exit_.obj \
	lib\f77vers.obj \
	lib\getarg_.obj \
	lib\getenv_.obj \
	lib\h_abs.obj \
	lib\h_dim.obj \
	lib\h_dnnt.obj \
	lib\h_indx.obj \
	lib\h_len.obj \
	lib\h_mod.obj \
	lib\h_nint.obj \
	lib\h_sign.obj \
	lib\hl_ge.obj \
	lib\hl_gt.obj \
	lib\hl_le.obj \
	lib\hl_lt.obj \
	lib\i_abs.obj \
	lib\i_dceiling.obj \
	lib\i_dim.obj \
	lib\i_dnnt.obj \
	lib\i_indx.obj \
	lib\i_len.obj \
	lib\i_len_trim.obj \
	lib\i_mod.obj \
	lib\i_nint.obj \
	lib\i_sceiling.obj \
	lib\i_sign.obj \
	lib\iargc_.obj \
	lib\l_ge.obj \
	lib\l_gt.obj \
	lib\l_le.obj \
	lib\l_lt.obj \
	lib\lbitbits.obj \
	lib\lbitshft.obj \
	lib\main.obj \
	lib\pow_ci.obj \
	lib\pow_dd.obj \
	lib\pow_di.obj \
	lib\pow_hh.obj \
	lib\pow_ii.obj \
	lib\pow_qq.obj \
	lib\pow_ri.obj \
	lib\pow_zi.obj \
	lib\pow_zz.obj \
	lib\qbitbits.obj \
	lib\qbitshft.obj \
	lib\r_abs.obj \
	lib\r_acos.obj \
	lib\r_asin.obj \
	lib\r_atan.obj \
	lib\r_atn2.obj \
	lib\r_cnjg.obj \
	lib\r_cos.obj \
	lib\r_cosh.obj \
	lib\r_dim.obj \
	lib\r_exp.obj \
	lib\r_imag.obj \
	lib\r_int.obj \
	lib\r_lg10.obj \
	lib\r_log.obj \
	lib\r_mod.obj \
	lib\r_nint.obj \
	lib\r_sign.obj \
	lib\r_sin.obj \
	lib\r_sinh.obj \
	lib\r_sqrt.obj \
	lib\r_tan.obj \
	lib\r_tanh.obj \
	lib\s_cat.obj \
	lib\s_cmp.obj \
	lib\s_copy.obj \
	lib\s_paus.obj \
	lib\s_rnge.obj \
	lib\s_stop.obj \
	lib\sig_die.obj \
	lib\signal_.obj \
	lib\system_.obj \
	lib\uninit.obj \
	lib\z_abs.obj \
	lib\z_cos.obj \
	lib\z_div.obj \
	lib\z_exp.obj \
	lib\z_log.obj \
	lib\z_sin.obj \
	lib\z_sqrt.obj

I77_files = \
	lib\close.obj \
	lib\dfe.obj \
	lib\dolio.obj \
	lib\due.obj \
	lib\endfile.obj \
	lib\err.obj \
	lib\fmt.obj \
	lib\fmtlib.obj \
	lib\ftell64_.obj \
	lib\ftell_.obj \
	lib\i77vers.obj \
	lib\iio.obj \
	lib\ilnw.obj \
	lib\inquire.obj \
	lib\lread.obj \
	lib\lwrite.obj \
	lib\open.obj \
	lib\rdfmt.obj \
	lib\rewind.obj \
	lib\rsfe.obj \
	lib\rsli.obj \
	lib\rsne.obj \
	lib\sfe.obj \
	lib\sue.obj \
	lib\typesize.obj \
	lib\uio.obj \
	lib\util.obj \
	lib\wref.obj \
	lib\wrtfmt.obj \
	lib\wsfe.obj \
	lib\wsle.obj \
	lib\wsne.obj \
	lib\xwsne.obj

headers=..\include\f2c_inline.h \
	..\include\f2c.h

libf2c_objs= $(F77_files) $(I77_files)

TARGETS=..\bin\f2c.exe ..\lib\f2c.lib $(headers)

.SUFFIXES: .c .obj

{$(srcdir)/src}.c{obj}.obj:
	$(CC) $(CFLAGS) /I../include /I. /I$(srcdir)/src /c /Fo$@ $<
{$(srcdir)/lib}.c{lib}.obj:
	$(CC) $(CFLAGS) /I../include /I. /I$(srcdir)/include /c /Fo$@ $<
{$(srcdir)/include}.h{../include}.h:
	copy $< $@

all: $(TARGETS)

..\bin\f2c.exe: $(f2c_objs)
	$(LINK) -out:$@ $(f2c_objs)

..\lib\f2c.lib: $(libf2c_objs)
	-del $@
	$(LINK) -lib -out:$@ $(libf2c_objs)

$(headers):
	copy ..\..\f2c\src\$@ $@

clean:
	-del $(libf2c_objs) $(f2c_objs) $(TARGETS)