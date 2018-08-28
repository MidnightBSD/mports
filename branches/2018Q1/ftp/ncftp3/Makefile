# $MidnightBSD$

PORTNAME=	ncftp
PORTVERSION=	3.2.5
PORTREVISION?=	1
CATEGORIES=	ftp ipv6
MASTER_SITES=	ftp://ftp.ncftp.com/ncftp/ \
		ftp://ftp.mirrorservice.org/sites/ftp.ncftp.com/ncftp/
DISTNAME=	ncftp-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ftp replacement with advanced user interface

LICENSE=	clartistic
LICENSE_NAME=	The Clarified Artistic License
LICENSE_FILE=	${WRKSRC}/doc/LICENSE.txt
LICENSE_PERMS=	pkg-mirror dist-mirror

USES=	tar:bzip2

.include <bsd.port.pre.mk>

.if defined(INSTALL_AS_NCFTP3)
LATEST_LINK=	ncftp3
.else
LATEST_LINK=	ncftp
.endif
WRKSRC=		${WRKDIR}/${DISTNAME:S/-src//}
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-ncurses
CONFIGURE_ENV=	TAR=/usr/bin/tar
PLIST_SUB=	NCFTP=${LATEST_LINK}
MAN1=		${LATEST_LINK}.1 ncftpbatch.1 ncftpget.1 ncftpls.1 ncftpput.1 \
		ncftpspooler.1
MAN3=		Strn.3

LIBNCFTP=	libncftp.so.3
LIBSIO=		libsio.so.5
LIBSTRN=	libStrn.so.1

pre-fetch:
	@${ECHO} ""
	@${ECHO} "Use INSTALL_AS_NCFTP3=yes to install ncftp v3 as ${PREFIX}/bin/ncftp3"
	@${ECHO} ""

pre-build:
	cd ${WRKSRC}/Strn ; make so
	cd ${WRKSRC}/libncftp ; make so
	cd ${WRKSRC}/sio; make so

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/bin/ncftp ${PREFIX}/bin/${LATEST_LINK}
	@cd ${WRKSRC}/bin ; ${INSTALL_PROGRAM} \
		ncftpbatch ncftpbookmarks ncftpget ncftpls ncftpput \
		${PREFIX}/bin
	@cd ${PREFIX}/bin && ${LN} -f ncftpbatch ncftpspooler
	@cd ${WRKSRC} && ${INSTALL_DATA} \
		Strn/${LIBSTRN} libncftp/${LIBNCFTP} sio/${LIBSIO} \
		${PREFIX}/lib
	@cd ${PREFIX}/lib \
		&& ${LN} -sf ${LIBSTRN} libStrn.so \
		&& ${LN} -sf ${LIBNCFTP} libncftp.so \
		&& ${LN} -sf ${LIBSIO} libsio.so
	@${INSTALL_MAN} ${WRKSRC}/doc/man/ncftp.1 \
		${PREFIX}/man/man1/${LATEST_LINK}.1
	@cd ${WRKSRC}/doc/man ; ${INSTALL_MAN} \
		ncftpbatch.1 ncftpget.1 ncftpls.1 ncftpput.1 ncftpspooler.1 \
		${PREFIX}/man/man1
	@${INSTALL_MAN} ${WRKSRC}/Strn/Strn.3 ${PREFIX}/man/man3

.include <bsd.port.post.mk>
