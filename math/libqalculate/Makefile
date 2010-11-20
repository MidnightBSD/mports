#
# $MidnightBSD: mports/math/libqalculate/Makefile,v 1.2 2009/09/20 01:26:18 laffer1 Exp $
#

PORTNAME=	libqalculate
PORTVERSION=	0.9.6
CATEGORIES=	math
MASTER_SITES=	SF/qalculate/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A a multi-purpose desktop calculator (backend library)
LICENSE=	gpl2

LIB_DEPENDS=	cln.5:${PORTSDIR}/math/cln

USE_GNOME=	glib20 gnomehack gnometarget intlhack libxml2
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:22
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s|docs||g' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's/^GMSGFMT = @GMSGFMT@/GMSGFMT = msgfmt/' ${WRKSRC}/po/Makefile.in.in
	@${REINPLACE_CMD} -e 's/-pthread/${PTHREAD_LIBS}/' ${WRKSRC}/configure

.include <bsd.port.mk>
