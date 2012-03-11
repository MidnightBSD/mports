# $MidnightBSD: mports/ftp/kwebget/Makefile,v 1.5 2011/02/02 21:00:01 laffer1 Exp $
# $FreeBSD: ports/ftp/kwebget/Makefile,v 1.14 2006/05/07 11:09:19 edwin Exp $

PORTNAME=	kwebget
PORTVERSION=	0.8.1
PORTREVISION=	3
CATEGORIES=	ftp kde
MASTER_SITES=	http://www.kpage.de/download/
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A KDE frontend to wget
LICENSE=	gpl2

RUN_DEPENDS=	${LOCALBASE}/bin/wget:${PORTSDIR}/ftp/wget

WRKSRC=		${WRKDIR}/${PORTNAME}

USE_BZIP2=	yes
USE_KDELIBS_VER=3
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool

post-patch:
	@${REINPLACE_CMD} -e 's|-O2||g ; \
		 s|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/${CONFIGURE_SCRIPT}
	@${REINPLACE_CMD} -e \
		's|$$(LIBSOCKET)$$|$$(LIBSOCKET) $$(LIBPTHREAD)|g' \
			${WRKSRC}/kwebget/Makefile.in

.include <bsd.port.mk>
