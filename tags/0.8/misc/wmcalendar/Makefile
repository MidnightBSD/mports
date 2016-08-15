# $MidnightBSD$
# $FreeBSD: ports/misc/wmcalendar/Makefile,v 1.12 2007/01/17 06:37:42 xride Exp $

PORTNAME=	wmcalendar
PORTVERSION=	0.5.2
PORTREVISION=	2
CATEGORIES=	misc windowmaker
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dockable calendar with interface to iCalendar based calendars

LICENSE=	gpl2

LIB_DEPENDS=	libical.so:${PORTSDIR}/devel/libical

WRKSRC=		${WRKDIR}/${DISTNAME}/Src

USE_XORG=	xpm
USE_GNOME=	gtk20
MAKE_ARGS=	CC="${CC}" \
		LFLAGS="`pkg-config --libs gtk+-2.0` -L${LOCALBASE}/lib" \
		CFLAGS="${CFLAGS}" \
		INCDIR="`pkg-config --cflags gtk+-2.0` -I${LOCALBASE}/include" \
		LIBDIR="" \
		LIBS="-lical -lXpm"
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

PLIST_FILES=	bin/wmCalendar man/man1/wmCalendar.1.gz

post-patch:
	${REINPLACE_CMD} -e 's#/usr/local#${LOCALBASE}#g' \
			-e 's#/usr/X11R6#${LOCALBASE}#g' \
			${WRKSRC}/Makefile
do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wmCalendar ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/wmCalendar.1 ${MANPREFIX}/man/man1

.include <bsd.port.mk>
