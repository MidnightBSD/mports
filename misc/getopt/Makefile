# $MidnightBSD: mports/misc/getopt/Makefile,v 1.2 2008/09/21 20:29:23 laffer1 Exp $
# $FreeBSD: ports/misc/getopt/Makefile,v 1.6 2005/11/21 13:15:48 sergei Exp $

PORTNAME=	getopt
PORTVERSION=	1.1.4
PORTREVISION=	1
CATEGORIES=	misc
MASTER_SITES=	http://software.frodo.looijaard.name/getopt/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A getopt(1) replacement that supports GNU-style long options
LICENSE=	gpl2

FAKE_OPTS+=	trueprefix

USE_GETTEXT=		yes
USE_GMAKE=		yes

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -lintl
MAKE_ENV=	LIBCGETOPT=0

MAN1=		getopt.1
DOCS=		Changelog README

post-patch:
	@${REINPLACE_CMD} -e 's|CC=gcc|CC=${CC}|' ${WRKSRC}/Makefile

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	@cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
