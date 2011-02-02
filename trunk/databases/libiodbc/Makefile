# New ports collection makefile for:	libiodbc
# Date created:				24 Mar 2000
# Whom:					erikhb@bgnett.no
#
# $MidnightBSD: mports/databases/libiodbc/Makefile,v 1.2 2009/12/31 23:28:24 laffer1 Exp $
# $FreeBSD: ports/databases/libiodbc/Makefile,v 1.28 2007/01/17 17:18:11 itetcu Exp $
#
# Note:  The location of ${INIDIR} and the installed name of the "odbctest"
#        binary were chosen such that this port does not conflict with
#        databases/unixODBC.

PORTNAME=	libiodbc
PORTVERSION=	3.52.7
CATEGORIES=	databases
MASTER_SITES=	http://www.iodbc.org/downloads/iODBC/ \
		SF/iodbc/iodbc/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An ODBC 3.x driver manager, for universal data source access
LICENSE=	lgpl

CONFLICTS=	unixODBC-[0-9]*

MAKE_JOBS_SAFE=	yes
USE_GNOME=	gnomehack pkgconfig
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS=	--with-iodbc-inidir=${ETCDIR}
USE_LDCONFIG=	yes

MAN1=		iodbc-config.1 iodbctest.1 iodbctestw.1

CPPFLAGS=	${PTHREAD_CFLAGS} -D_BSD_WCHAR_T_DEFINED_
LDFLAGS=	${PTHREAD_LIBS}

.if defined(WITH_GUI)
USE_GNOME+=	gtk20
MAN1+=		iodbcadm-gtk.1
PLIST_SUB+=	GUI=""
.else
CONFIGURE_ARGS+=	--disable-gui
PLIST_SUB+=	GUI="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e \
		's|$$CFLAGS -pthread|$$CFLAGS|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e \
		'/^SUBDIRS/s|samples||' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e \
		's|-ldl||g' ${WRKSRC}/admin/libiodbc.pc.in

post-install:
	@${MKDIR} ${ETCDIR}
	${INSTALL_DATA} ${WRKSRC}/etc/odbc*.ini.sample ${ETCDIR}
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for f in AUTHORS ChangeLog NEWS README
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
	@${MKDIR} ${EXAMPLESDIR}
.for f in Makefile iodbctest.c
	${INSTALL_DATA} ${WRKSRC}/samples/${f} ${EXAMPLESDIR}
.endfor
.endif

.include <bsd.port.mk>
