# $MidnightBSD: mports/comms/minicom/Makefile,v 1.6 2010/11/11 01:25:47 laffer1 Exp $
# $FreeBSD: ports/comms/minicom/Makefile,v 1.47 2006/05/03 23:38:36 edwin Exp $

PORTNAME=	minicom
PORTVERSION=	2.5
CATEGORIES=	comms
MASTER_SITES=	http://alioth.debian.org/frs/download.php/3487/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An MS-DOS Telix serial communication program "workalike"
LICENSE=	gpl2

RUN_DEPENDS=	lrz:${PORTSDIR}/comms/lrzsz

MAKE_JOBS_SAFE=	yes

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--enable-dfl-baud=57600 \
			--sysconfdir=${PREFIX}/etc/minicom \
			--enable-lock-dir=/var/spool/lock \
			--enable-dfl-port=${MINICOM_DEFAULT_PORT} \
			CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"

MAN1=		minicom.1 runscript.1 ascii-xfr.1 xminicom.1

.include <bsd.port.pre.mk>

MINICOM_DEFAULT_PORT?=	/dev/cuad0

post-patch:
	${REINPLACE_CMD} -e "s@/usr/local/bin/@${LOCALBASE}/bin/@; \
		s@/sz@/lsz@;s@/sb@/lsb@;s@/sx@/lsx@;s@/rz@/lrz@; \
		s@/rb@/lrb@;s@/rx@/lrx@" ${WRKSRC}/src/rwconf.c
	${REINPLACE_CMD} -E -e "s@^(SUBDIRS = .*) intl@\1@" \
		${WRKSRC}/Makefile.in

post-install:
	${CHOWN} uucp:dialer ${PREFIX}/bin/minicom
	${CHMOD} 4511 ${PREFIX}/bin/minicom
	${INSTALL} -d -o root -g wheel -m 0755 ${PREFIX}/etc/minicom
	${CHOWN} uucp ${PREFIX}/etc/minicom
.if !defined(NOPORTDOCS)
	${INSTALL} -d -o root -g wheel -m 0755 ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/AUTHORS ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/COPYING ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/ChangeLog ${DOCSDIR}/
	(umask 022 && cd ${WRKSRC} && ${TAR} --exclude '*/Makefile*' \
		 --exclude '*.orig' -chf - extras doc | ${TAR}  -xf - -C \
		${DOCSDIR})
.endif

.include <bsd.port.post.mk>
