# $MidnightBSD: mports/misc/wmcalendar/Makefile,v 1.1 2007/03/09 05:22:05 laffer1 Exp $
# $FreeBSD: ports/misc/wmcalendar/Makefile,v 1.12 2007/01/17 06:37:42 xride Exp $

PORTNAME=	wmcalendar
PORTVERSION=	0.5.2
PORTREVISION=	1
CATEGORIES=	misc windowmaker
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A dockable calendar with interface to iCalendar based calendars
LICENSE=	gpl2

LIB_DEPENDS=	ical.43:${PORTSDIR}/devel/libical

WRKSRC=		${WRKDIR}/${DISTNAME}/Src

USE_XORG=	xpm
USE_GNOME=	gtk20
MAKE_ARGS=	CC="${CC}" \
		LFLAGS="`pkg-config --libs gtk+-2.0` -L${LOCALBASE}/lib" \
		CFLAGS="${CFLAGS}" \
		INCDIR="`pkg-config --cflags gtk+-2.0` -I${LOCALBASE}/include" \
		LIBDIR="" \
		LIBS="-lical -lXpm"

MAN1=		wmCalendar.1
PLIST_FILES=	bin/wmCalendar

post-patch:
	${REINPLACE_CMD} -e 's#/usr/local#${LOCALBASE}#g' \
			-e 's#/usr/X11R6#${LOCALBASE}#g' \
			${WRKSRC}/Makefile
do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wmCalendar ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/wmCalendar.1 ${MANPREFIX}/man/man1

.include <bsd.port.mk>
