# New ports collection makefile for:   mlvwm
# Date created:        19 Januruary 1997
# Whom:                Yukihiro Nakai <Nakai@Mlab.t.u-tokyo.ac.jp>
#
# $FreeBSD: ports/x11-wm/mlvwm/Makefile,v 1.26 2006/09/17 02:11:02 kris Exp $
# $MidnightBSD: mports/x11-wm/mlvwm/Makefile,v 1.4 2008/03/05 03:23:53 laffer1 Exp $
#

PORTNAME=	mlvwm
PORTVERSION=	0.9.1
CATEGORIES=	x11-wm
MASTER_SITES=	http://www2u.biglobe.ne.jp/~y-miyata/mlvwm/
DISTNAME=	mlvwm091
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} mini-icons.tar.gz
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Macintosh like window manager for X11
LICENSE=	mit

DEPRECATED=	Project is dead

USE_IMAKE=	yes
USE_X_PREFIX=	yes
USE_PERL5_BUILD=yes
USE_XPM=	yes
MAN1=		mlvwm.1

MLVWMLIBDIR=	${PREFIX}/lib/X11/mlvwm

.include <bsd.port.pre.mk>

post-extract:
	@${TAR} -C ${WRKSRC}/pixmap -xzf ${DISTDIR}/mini-icons.tar.gz

post-patch:
	@${PERL} -pi -e "s|%%PREFIX%%|${PREFIX}|g" ${WRKSRC}/sample_rc/Mlvwmrc*

post-install:
	@${RM} -f ${WRKSRC}/sample_rc/*.orig
	@${MKDIR} ${MLVWMLIBDIR}/pixmap
	${INSTALL_DATA} ${WRKSRC}/pixmap/*.xpm ${MLVWMLIBDIR}/pixmap
	${INSTALL_DATA} ${WRKSRC}/sample_rc/Mlvwmrc* ${MLVWMLIBDIR}

.include <bsd.port.post.mk>
