# $MidnightBSD$
# $FreeBSD: ports/devel/glib20-reference/bsd.gnome-reference.mk,v 1.6 2006/05/17 20:56:52 ahze Exp $

PARENTDIR?=	${.CURDIR:S|-reference$||}
REFERENCE_PORT=	${PKGORIGIN:S|-reference$||}

.include "${PARENTDIR}/Makefile"

.if !defined(DOCSDIR)
DOCSDIR:=	${PREFIX}/share/doc/${PORTNAME}
.endif
.if !defined(EXAMPLESDIR)
EXAMPLESDIR:=	${PREFIX}/share/examples/${PORTNAME}
.endif
.if defined(DISTNAME)
DISTNAME:=	${DISTNAME}
.else
DISTNAME:=	${PORTNAME}-${DISTVERSIONPREFIX}${DISTVERSION}${DISTVERSIONSUFFIX}
.endif
.if defined(MASTER_SITE_SUBDIR)
MASTER_SITE_SUBDIR:=	${MASTER_SITE_SUBDIR}
.endif
PKGNAMESUFFIX:=	${PKGNAMESUFFIX}-reference

COMMENT=	Programming reference for ${REFERENCE_PORT}

DISTINFO_FILE=	${PARENTDIR}/distinfo

REFERENCE_SRC?=	${WRKSRC}/docs/reference
BOOKS?=		.

PORTDOCS?=	*
OPTIONS_DEFINE+=	DOCS

.if !target(do-build)
do-build:
	@${DO_NADA}
.endif

make-descr:
	@${ECHO_CMD} "This port contains the programming reference for ${REFERENCE_PORT}." > ${DESCR}
	@www=`${GREP} "^WWW:" ${PARENTDIR}/pkg-descr` || ${TRUE}; \
	if [ -n "$$www" ]; then \
		${ECHO_CMD} "" >> ${DESCR}; \
		${ECHO_CMD} "$$www" >> ${DESCR}; \
	fi

.if !target(do-install)
do-install:
.    for d in ${BOOKS}
	if [ -d ${REFERENCE_SRC}/${d}/html ]; then \
		${MKDIR} ${DOCSDIR}/${d}; \
		cd ${REFERENCE_SRC}/${d}/html && \
		${COPYTREE_SHARE} . ${DOCSDIR}/${d}; \
	fi
.    endfor
.endif

.include <bsd.port.mk>
