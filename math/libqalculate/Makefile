#
# $MidnightBSD: ports/math/libqalculate/Makefile,v 1.17 2008/06/06 13:44:00 edwin Exp $
#

PORTNAME=	libqalculate
PORTVERSION=	0.9.6
CATEGORIES=	math
MASTER_SITES=	SF/qalculate

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A a multi-purpose desktop calculator (backend library)
LICENSE=	gpl2

LIB_DEPENDS=	cln.5:${PORTSDIR}/math/cln

USE_GNOME=	glib20 gnomehack gnometarget intlhack libxml2
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s|docs||g' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's/^GMSGFMT = @GMSGFMT@/GMSGFMT = msgfmt/' ${WRKSRC}/po/Makefile.in.in
	@${REINPLACE_CMD} -e 's/-pthread/${PTHREAD_LIBS}/' ${WRKSRC}/configure

.include <bsd.port.mk>
