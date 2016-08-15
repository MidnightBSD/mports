# $MidnightBSD$

PORTNAME=	grep
PORTVERSION=	20111002
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	gabor
PKGNAMEPREFIX=	bsd-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	BSD-licensed version of grep

LICENSE=	bsd3

MAKE_ENV+=	BINDIR="${PREFIX}/bin" \
		MANDIR="${MANPREFIX}/man/man" \
		CATDIR="${MANPREFIX}/man/man" \
		NLSDIR="${PREFIX}/share/nls"

OPTIONS_DEFINE=	GNU_COMPAT NLS
OPTIONS_DEFAULT=	GNU_COMPAT
GNU_COMPAT_DESC=	Use GNU regex library (recommended)

CONFLICTS=	gnugrep-*

.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MNLS}
PLIST_SUB+=	NLS=""
.else
MAKE_ENV+=	WITHOUT_NLS=yes
PLIST_SUB+=	NLS="@comment "
.endif

.if !${PORT_OPTIONS:MGNU_COMPAT}
MAKE_ENV+=	WITHOUT_GNU_COMPAT=yes
.endif

pre-install:
.if ${PORT_OPTIONS:MNLS}
	${MKDIR} ${PREFIX}/share/nls/gl_ES.ISO8859-1
.endif

.include <bsd.port.post.mk>
