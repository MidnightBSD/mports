PORTNAME=	ocamlbuild
PORTVERSION=	0.14.2
PORTREVISION=	0
CATEGORIES=	devel
PKGNAMEPREFIX=	ocaml-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Legacy build tool for OCaml libraries and programs
WWW=		https://github.com/ocaml/ocamlbuild

LICENSE=	gpl2

USES=		gmake ocaml
USE_GITHUB=	yes
GH_ACCOUNT=	ocaml

ALL_TARGET=	configure all
MAKE_ENV=	OCAMLBUILD_LIBDIR=${PREFIX}/${OCAML_LIBDIR}
TEST_TARGET=	test
TEST_ENV=	VERBOSE=1

.include <bsd.mport.options.mk>

post-fake:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/man/man1
	${MV} ${FAKE_DESTDIR}${PREFIX}/man/man1/* ${FAKE_DESTDIR}${PREFIX}/share/man/man1/

.include <bsd.port.mk>
