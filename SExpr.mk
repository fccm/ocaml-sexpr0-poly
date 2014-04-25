OCAML = ocaml
OCAMLC = ocamlc
OCAMLOPT = ocamlopt

all: lib opt
.PHONY: lib opt
lib: SExpr.cma
opt: SExpr.cmxa

SExpr.cmi: SExpr.mli
	$(OCAMLC) -c $<
SExpr.cmo: SExpr.ml SExpr.cmi
	$(OCAMLC) -c $<
SExpr.cmx: SExpr.ml SExpr.cmi
	$(OCAMLOPT) -c $<

SExpr.cma: SExpr.cmo
	$(OCAMLC) -a -o $@ $<
SExpr.cmxa: SExpr.cmx
	$(OCAMLOPT) -a -o $@ $<

test: SExpr.cmo
	$(OCAML) SExpr.cmo SExpr_test.ml
clean:
	$(RM) SExpr.[oa] SExpr.cm[ioxa] SExpr.cmx[as]

.PHONY: test clean

