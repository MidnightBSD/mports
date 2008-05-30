# New ports collection makefile for:	jags
# Date created:				May 30, 2008
# Whom:					Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD$
#

PORTNAME=	jags
PORTVERSION=	0.20.2
PORTREVISION=	0
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE} \
		http://sumpan.campus.luth.se/software/jags/download/
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JAGS - Just Another GTK+ Samba Client
LICENSE=	gpl2

NO_LATEST_LINK=	yes
USE_GMAKE=	yes
USE_XORG=	xpm
USE_GNOME=	gtk12
USE_PERL5_BUILD=yes
GNU_CONFIGURE=	yes

.include <bsd.port.pre.mk>

pre-patch:
	@${PERL} -pi.fbsd -e 's@/usr/local/share/jags/@${PREFIX}/share/jags/@g' \
		${WRKSRC}/src/jagsconfig.cpp
	@${PERL} -pi.fbsd -e 's@/usr/local/share/jags/pixmaps/@${PREFIX}/share/jags/pixmaps/@g' \
		${WRKSRC}/src/gtk_common.cpp

.include <bsd.port.post.mk>
