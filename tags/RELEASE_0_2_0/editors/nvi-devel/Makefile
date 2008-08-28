# New ports collection makefile for:	nvi-devel
# Date created:			27 Dec 2007
# Whom:				Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	nvi
PORTVERSION=	1.81.5
CATEGORIES=	editors
MASTER_SITES=	http://193.190.253.81/~skimo/nvi/devel/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	dd

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Development snapshot of the world-renown nvi editor
LICENSE=	bsd3

BUILD_DEPENDS=	iconv:${PORTSDIR}/converters/libiconv
LIB_DEPENDS=	db3.3:${PORTSDIR}/databases/db3

USE_BZIP2=		yes
WRKSRC=			${WRKDIR}/${DISTNAME}/build.unix
USE_AUTOTOOLS=		libtool:15
USE_LDCONFIG=		yes
CONFIGURE_ARGS+=	--with-db3=${LOCALBASE}
CONFIGURE_SCRIPT=	../dist/configure
MAN1=			ex.1 vi.1 view.1

.include <bsd.port.pre.mk>

post-configure:
	${ECHO_CMD} "#undef HAVE_SYS_SELECT_H" >> ${WRKSRC}/config.h

post-install:
.for __p in ex vi view
	@# XXX: Hack the Makefile in the distribution so this isn't necessary.
	${RM} ${PREFIX}/man/cat1/${__p}.0
.endfor

.include <bsd.port.post.mk>
