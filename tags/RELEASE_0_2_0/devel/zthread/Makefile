# New ports collection makefile for:	ZThread
# Date created:				23 May 2001
# Whom:					pvh@egenetics.com
#
# $MidnightBSD: mports/devel/zthread/Makefile,v 1.1 2006/10/03 20:18:15 laffer1 Exp $
# $FreeBSD: ports/devel/zthread/Makefile,v 1.21 2006/06/19 20:06:51 shaun Exp $
#

PORTNAME=	zthread
PORTVERSION=	2.3.2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTNAME=	ZThread-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A platform-independent object-oriented C++ threading library

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-ftime --disable-static
USE_GMAKE=	yes
MAKE_ARGS+=	INSTALL_PROGRAM="${INSTALL_SCRIPT}"
MAKE_ENV+=	SED=sed # req'd for LIBTOOL?!
USE_LDCONFIG=	yes

PORTDOCS=	AUTHORS ChangeLog NEWS README TODO

.include <bsd.port.pre.mk>

post-extract:
	@${FIND} ${WRKSRC} -name CVS -type d -delete

post-patch:
	@${FIND} ${WRKSRC} \( -name '*.orig' -or -name '*.swp' \) -delete

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
