

PORTNAME=	enscript
PORTVERSION=	1.6.6
PORTREVISION=	1
CATEGORIES+=	print
MASTER_SITES=	GNU
PKGNAMESUFFIX=	-${PAPERSIZE}
DISTNAME=	enscript-${PORTVERSION}

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	ASCII to PostScript filter

LICENSE=	gpl2

USES=		cpe shebangfix perl5
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-media=${PS}
SHEBANG_FILES=	scripts/diffpp.in scripts/sliceprint.in
perl_OLD_CMD=	@PERLPROG@

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes
NLS_USES=	gettext
NLS_CONFIGURE_ENABLE=	nls

CONFLICTS?=	enscript-a4-[0-9]* enscript-letterdj-[0-9]*

INFO=		enscript
CPE_VENDOR=	gnu

PS?=		Letter
PAPERSIZE?=	${PS:tl}

.if (${PAPERSIZE} != a4 && ${PAPERSIZE} != letter && ${PAPERSIZE} != letterdj)
.BEGIN:
	@${ECHO} "Error: invalid value for PAPERSIZE: \"${PAPERSIZE}\""
	@${ECHO} "Possible values are:  a4, letter, or letterdj"
	@${FALSE}
.endif

post-configure:
	${REINPLACE_CMD} -e 's|/usr/bin/perl|${PERL}|g' ${WRKSRC}/scripts/Makefile

.include <bsd.port.mk>
