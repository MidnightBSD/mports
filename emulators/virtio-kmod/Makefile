# $MidnightBSD$

PORTNAME=	virtio
PORTVERSION=	0.${SVN_REV}
PORTREVISION=	2
CATEGORIES=	emulators kld
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	kuriyama
PKGNAMESUFFIX=	-kmod-${OSBRANCH}
DISTFILES=	${FILE_8} ${FILE_9}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	virtio kernel modules port for 0.4

LICENSE=	bsd2

WRKSRC=		${WRKDIR}
KMODDIR?=	/boot/modules
PLIST_SUB=	KMODDIR=${KMODDIR:C,^/,,}
NEEDSUBDIRS=	amd64 cam conf contrib dev/pci geom i386 kern net netinet netinet6 \
	sys tools vm x86

.include <bsd.port.pre.mk>

.if !exists(${SRC_BASE}/sys/Makefile)
IGNORE=		requires kernel source to be installed
.endif

SVN_REV=	250249
FILE_9=		${PORTNAME}-9-0.${SVN_REV}${EXTRACT_SUFX}
OSBRANCH=	9.1
EXTRACT_ONLY=	${FILE_9}

post-extract:
	cd ${WRKSRC} && ${MKDIR} sys/dev tmp && ${MV} dev modules tmp/
.for d in ${NEEDSUBDIRS}
	[ ! -d ${SRC_BASE}/sys/${d} ] || ${CP} -Rp ${SRC_BASE}/sys/${d} ${WRKSRC}/sys/${d}
.endfor
	${CP} -Rp ${WRKSRC}/tmp/* ${WRKSRC}/sys/

do-build:
	cd ${WRKSRC}/sys/modules/virtio; ${MAKE} DEBUG_FLAGS=-g

do-install:
	${MKDIR} ${FAKE_DESTDIR}/boot/modules
.for f in pci/virtio_pci virtio/virtio block/virtio_blk balloon/virtio_balloon network/if_vtnet
	${INSTALL_KLD} ${WRKSRC}/sys/modules/virtio/${f}.ko ${KMODDIR}
	${INSTALL_KLD} ${WRKSRC}/sys/modules/virtio/${f}.ko.symbols ${KMODDIR}
.endfor
	/usr/sbin/kldxref ${KMODDIR}

# For maintainer only.
SVN_MIRROR?=	http://svn.freebsd.org/base
EXPDIR=		${WRKSRC}/src/sys
maintainer-tar:
	${MKDIR} ${EXPDIR}
	cd ${EXPDIR} && svn export -r ${SVN_REV} ${SVN_MIRROR}/stable/9/sys/dev/virtio dev/virtio
	cd ${EXPDIR} && svn export -r ${SVN_REV} ${SVN_MIRROR}/stable/9/sys/modules/virtio modules/virtio
	cd ${EXPDIR} && ${TAR} cfvz ${DISTDIR}/${FILE_9} dev modules
	cd ${EXPDIR} && ${RM} -rf dev modules
	cd ${EXPDIR} && svn export -r ${SVN_REV} ${SVN_MIRROR}/stable/8/sys/dev/virtio dev/virtio
	cd ${EXPDIR} && svn export -r ${SVN_REV} ${SVN_MIRROR}/stable/8/sys/modules/virtio modules/virtio
	cd ${EXPDIR} && ${TAR} cfvz ${DISTDIR}/${FILE_8} dev modules

maintainer-check:
	@new9=`svn log -ql 1 ${SVN_MIRROR}@HEAD stable/9/sys/dev/virtio | ${GREP} -v ^- | ${SED} -e 's| .*||; s|r||'`;\
	new8=`svn log -ql 1 ${SVN_MIRROR}@HEAD stable/8/sys/dev/virtio | ${GREP} -v ^- | ${SED} -e 's| .*||; s|r||'`;\
	old="${SVN_REV}";\
	if [ "$${new9}" -gt "$${old}" ]; then ${ECHO_MSG} "New virtio rev: r$${new9} (was $${old}, 8-stable is $${new8})"; fi

.include <bsd.port.post.mk>
