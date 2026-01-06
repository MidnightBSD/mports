PORTNAME=	hevea
PORTVERSION=	2.36
CATEGORIES=	textproc
MASTER_SITES=	http://moscova.inria.fr/~maranget/${PORTNAME}/distri/
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert LaTeX to HTML
WWW=		http://para.inria.fr/~maranget/hevea/

BUILD_DEPENDS=	ocamlbuild:devel/ocaml-ocamlbuild

PLIST_SUB=	HEVEAVERSION=${PORTVERSION}

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

DOCS_DISTFILES+=	${PORTNAME}-${PORTVERSION}-manual.pdf \
			${PORTNAME}-${PORTVERSION}-manual.tar.gz

.include <bsd.mport.options.mk>

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/esponja
	@${STRIP_CMD} ${PREFIX}/bin/bibhva
	@${STRIP_CMD} ${PREFIX}/bin/hevea
	@${STRIP_CMD} ${PREFIX}/bin/hacha

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/doc/hevea
	${INSTALL_DATA} ${DISTDIR}/${PORTNAME}-${PORTVERSION}-manual.pdf ${FAKE_DESTDIR}${PREFIX}/share/doc/hevea
	(cd ${FAKE_DESTDIR}${PREFIX}/share/doc/hevea; ${TAR} xvfz ${DISTDIR}/${PORTNAME}-${PORTVERSION}-manual.tar.gz)

.include <bsd.port.mk>
