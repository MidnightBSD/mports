# New ports collection makefile for:	motor
# Date created:				20 February 2001
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/devel/motor/Makefile,v 1.3 2007/08/22 10:18:38 laffer1 Exp $
# $FreeBSD: ports/devel/motor/Makefile,v 1.24 2006/08/18 17:16:36 delphij Exp $
#

PORTNAME=	motor
PORTVERSION=	3.4.0
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	http://thekonst.net/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A powerful text mode based programming IDE
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_ICONV=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-libiconv-prefix=${LOCALBASE}
.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
CONFIGURE_ARGS+=--with-libintl-prefix=${LOCALBASE}
PLIST_SUB=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB=	NLS="@comment "
.endif

MAN1=		motor.1

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|zxvf|&o|' ${WRKSRC}/share/Makefile.in

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	@(cd ${WRKSRC} ; ${INSTALL_DATA} FAQ README ${DOCSDIR})
.endif

.include <bsd.port.post.mk>
