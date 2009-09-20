# New ports collection makefile for:    unixODBC
# Date created:         May 11, 2000
# Whom:                 Nick Sayer <nsayer@FreeBSD.org>
#
# $MidnightBSD: mports/databases/unixODBC/Makefile,v 1.3 2008/04/11 20:44:20 laffer1 Exp $
# $FreeBSD: ports/databases/unixODBC/Makefile,v 1.52 2007/07/30 15:30:55 arved Exp $
#

PORTNAME=	unixODBC
PORTVERSION=	2.2.12
CATEGORIES=	databases
MASTER_SITES=	http://www.unixodbc.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ODBC library suite for Unix
LICENSE=	lgpl

CONFLICTS=	libiodbc-[0-9]*

USE_GNOME=	gnomehack gnometarget
USE_ICONV=	yes
USE_AUTOTOOLS=	libtool:22
CONFIGURE_ARGS=	--enable-static --enable-shared \
		--with-libiconv-prefix=${LOCALBASE}
USE_LDCONFIG=	yes

.if defined(WITH_GUI)
USE_QT_VER=	3
QT_NONSTANDARD=	yes
CONFIGURE_ENV=	MOC="${MOC}" \
		QTINC="${QT_PREFIX}/include" \
		QTLIB="${QT_PREFIX}/lib" \
		USER_INCLUDES="${QTCPPFLAGS}" \
		USER_LDFLAGS="${QTCFGLIBS}"
CONFIGURE_ARGS+=	--enable-gui
PLIST_SUB=	GUI:=""
.else
CONFIGURE_ARGS+=	--disable-gui
PLIST_SUB=	GUI:="@comment "
.endif

.if !defined(WITHOUT_THREADS) || defined(WITH_GUI)
CONFIGURE_ARGS+=	--enable-threads=yes
.else
CONFIGURE_ARGS+=	--enable-threads=no
.endif

post-patch:
	@${REINPLACE_CMD} -e 's,@MSQL_TRUE@lib_LTLIBRARIES,#@MSQL_TRUE@lib_LTLIBRARIES,' ${WRKSRC}/Drivers/MiniSQL/Makefile.in

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${TAR} -C ${WRKSRC}/doc --exclude '*Makefile*' -cf - . \
		| ${TAR} -C ${DOCSDIR} --unlink -xf -
.if !defined(INSTALL_AS_USER)
	@${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR}
	${FIND} ${DOCSDIR} -type d -print0 | ${XARGS} -0 ${CHMOD} 755
	${FIND} ${DOCSDIR} -type f -print0 | ${XARGS} -0 ${CHMOD} 644
.endif
.endif
.for conffile in odbc.ini odbcinst.ini
	@if [ ! -f ${PREFIX}/etc/${conffile} ]; then \
		${CP} -p ${PREFIX}/etc/${conffile}.sample ${PREFIX}/etc/${conffile} ; \
	fi
.endfor

.include <bsd.port.mk>
