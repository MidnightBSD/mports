# $FreeBSD: ports/devel/judy/Makefile,v 1.12 2008/05/13 09:36:54 skv Exp $
# $MidnightBSD$

PORTNAME=	Judy
PORTVERSION=	1.0.5
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME:tl}/${PORTNAME:tl}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General purpose dynamic array

LICENSE=        lgpl

GNU_CONFIGURE=	yes

USES=		gmake
USE_LDCONFIG=	YES
MAKE_JOBS_UNSAFE=	yes

WRKSRC=	${WRKDIR}/judy-${PORTVERSION}

SHLIB_MAJOR=	1
PLIST_SUB=	SHLIB_MAJOR="${SHLIB_MAJOR}"

LIST_DOCS=	COPYRIGHT README *.htm

post-install:
.ifndef(NOPORTDOCS)
	@${ECHO_MSG} "===>   Installing documentation for ${PKGNAME}"
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${LIST_DOCS:S!^!${WRKSRC}/doc/ext/!} ${DOCSDIR}
.endif

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
CONFIGURE_ARGS+=	--enable-32-bit
.elif ${ARCH} == "amd64" 
CONFIGURE_ARGS+=	--enable-64-bit
.endif

.include <bsd.port.post.mk>
