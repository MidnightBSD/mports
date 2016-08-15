# $MidnightBSD$
# $FreeBSD: ports/databases/libiodbc/Makefile,v 1.28 2007/01/17 17:18:11 itetcu Exp $
#
# Note:  The location of ${INIDIR} and the installed name of the "odbctest"
#        binary were chosen such that this port does not conflict with
#        databases/unixODBC.

PORTNAME=	libiodbc
PORTVERSION=	3.52.9
CATEGORIES=	databases
MASTER_SITES=	SF/iodbc/iodbc/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ODBC 3.x driver manager, for universal data source access

LICENSE=		bsd3 lgpl
LICENSE_COMB=		dual
LICENSE_FILE_BSD=	${WRKSRC}/LICENSE.BSD
LICENSE_FILE_LGPL20=	${WRKSRC}/LICENSE.LGPL

USES=		libtool pathfix pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-iodbc-inidir=${ETCDIR} \
		--includedir=${LOCALBASE}/include/libiodbc \
		--disable-libodbc
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	GTK2 DOCS EXAMPLES
OPTIONS_SUB=	yes

GTK2_USE=	GNOME=gtk20
GTK2_CONFIGURE_ENABLE=	gui

post-patch:
	@${REINPLACE_CMD} -e \
		'/^SUBDIRS/s|samples||' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e \
		's|-ldl||g' ${WRKSRC}/admin/libiodbc.pc.in

post-install:
	@${MKDIR} ${ETCDIR}
	${INSTALL_DATA} ${WRKSRC}/etc/odbc*.ini.sample ${ETCDIR}
	@${MKDIR} ${DOCSDIR}
.for f in AUTHORS ChangeLog NEWS README
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
	@${MKDIR} ${EXAMPLESDIR}
.for f in Makefile.sample iodbctest.c
	${INSTALL_DATA} ${WRKSRC}/samples/${f} ${EXAMPLESDIR}
.endfor

.include <bsd.port.mk>
