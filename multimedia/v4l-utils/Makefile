# Created by: Juergen Lock <nox@FreeBSD.org>

PORTNAME?=	v4l-utils
PORTREVISION=	0

COMMENT=	Video4Linux utilities

MASTERDIR=	${.CURDIR}/../../multimedia/libv4l
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

INSTALL_WRKSRC=	${WRKSRC}/utils

post-extract:
	${REINPLACE_CMD} -e 's|"../utils/libv4l2util/v4l2_driver.h"|"utils/libv4l2util/v4l2_driver.h"|g' \
	${WRKSRC}/contrib/decode_tm6000/decode_tm6000.c
 

# no need for udev rules
post-install:
	@${RM} -r ${FAKE_DESTDIR}/lib/udev

.include "${MASTERDIR}/Makefile"
