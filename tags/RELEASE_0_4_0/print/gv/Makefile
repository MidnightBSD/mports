# $MidnightBSD: mports/print/gv/Makefile,v 1.5 2010/12/11 19:09:07 laffer1 Exp $
# $FreeBSD: ports/print/gv/Makefile,v 1.70 2010/08/06 20:55:27 bf Exp $

PORTNAME=	gv
PORTVERSION=	3.7.2
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A PostScript and PDF previewer
LICENSE=	gpl3

LIB_DEPENDS=	Xaw3d:${PORTSDIR}/x11-toolkits/Xaw3d

USE_XORG=	xpm ice sm xext xmu x11
USE_GHOSTSCRIPT=	yes
USE_GMAKE=	yes
USE_ICONV=	yes
USE_PERL5_BUILD=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV+=	CPPFLAGS="${CPPFLAGS}" \
		LDFLAGS="${LDFLAGS}" \
		LIBS="-liconv"
CONFIGURE_ARGS+=	--libdir=${PREFIX}/lib/X11 \
			--enable-setenv-code \
			--enable-SIGCHLD-fallback

MAN1=		gv.1 gv-update-userconfig.1
INFO=		gv
PLIST_FILES=	bin/gv \
		bin/gv-update-userconfig \
		%%DATADIR%%/gv_class.ad \
		%%DATADIR%%/gv_copyright.dat \
		%%DATADIR%%/gv_spartan.dat \
		%%DATADIR%%/gv_system.ad \
		%%DATADIR%%/gv_user.ad \
		%%DATADIR%%/gv_user_res.dat \
		%%DATADIR%%/gv_widgetless.dat \
		%%DATADIR%%/safe-gs-workdir/.keep_me \
		lib/X11/app-defaults/GV
PLIST_DIRS=	%%DATADIR%%/safe-gs-workdir \
		%%DATADIR%%

post-install:
	@${TOUCH} ${DATADIR}/safe-gs-workdir/.keep_me

.include <bsd.port.mk>
