# New ports collection makefile for: openoffice2-linux
# Date created:		June 4 2008
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/editors/linux-openoffice3/Makefile,v 1.4 2008/10/21 20:56:06 laffer1 Exp $
#

PORTNAME=	openoffice3
PORTVERSION=	${OO_RELEASE}
PORTREVISION=	1
CATEGORIES=	editors java linux
MASTER_SITES=	${MASTER_SITE_OPENOFFICE:=stable/${OO_RELEASE}/}
PKGNAMEPREFIX?=	linux-
DISTNAME=	OOo_${OO_RELEASE}_LinuxIntel_install_en-US
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	luke@midnightbsd.org
COMMENT=	Integrated office productivity suite (binary pkg)
LICENSE=	lgpl

RUN_DEPENDS+=	${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme

ONLY_FOR_ARCHS=	i386 amd64

USE_GCPIO=	yes
USE_LINUX=	yes
USE_XORG=	x11 ice xaw xau xext xrender xrandr \
		xi xt xcursor xdamage xcomposite xfixes
NO_BUILD=	yes

OO_VER=		3.0
OO_RELEASE=	3.0.1
OO_BUILD=	9379

RPM2CPIO?=	${LOCALBASE}/bin/rpm2cpio
BUILD_DEPENDS+=	${RPM2CPIO}:${PORTSDIR}/archivers/rpm
RC_CMD?=			${RPM2CPIO}
RC_AFTER_ARGS?=	| ${CPIO} -id --quiet

RPMFILES= \
	ooobasis3.0-base-3.0.1-9379.i586.rpm \
	ooobasis3.0-binfilter-3.0.1-9379.i586.rpm \
	ooobasis3.0-calc-3.0.1-9379.i586.rpm \
	ooobasis3.0-core01-3.0.1-9379.i586.rpm \
	ooobasis3.0-core02-3.0.1-9379.i586.rpm \
	ooobasis3.0-core03-3.0.1-9379.i586.rpm \
	ooobasis3.0-core04-3.0.1-9379.i586.rpm \
	ooobasis3.0-core05-3.0.1-9379.i586.rpm \
	ooobasis3.0-core06-3.0.1-9379.i586.rpm \
	ooobasis3.0-core07-3.0.1-9379.i586.rpm \
	ooobasis3.0-draw-3.0.1-9379.i586.rpm \
	ooobasis3.0-en-US-3.0.1-9379.i586.rpm \
	ooobasis3.0-en-US-base-3.0.1-9379.i586.rpm \
	ooobasis3.0-en-US-binfilter-3.0.1-9379.i586.rpm \
	ooobasis3.0-en-US-calc-3.0.1-9379.i586.rpm \
	ooobasis3.0-en-US-draw-3.0.1-9379.i586.rpm \
	ooobasis3.0-en-US-help-3.0.1-9379.i586.rpm \
	ooobasis3.0-en-US-impress-3.0.1-9379.i586.rpm \
	ooobasis3.0-en-US-math-3.0.1-9379.i586.rpm \
	ooobasis3.0-en-US-res-3.0.1-9379.i586.rpm \
	ooobasis3.0-en-US-writer-3.0.1-9379.i586.rpm \
	ooobasis3.0-gnome-integration-3.0.1-9379.i586.rpm \
	ooobasis3.0-graphicfilter-3.0.1-9379.i586.rpm \
	ooobasis3.0-images-3.0.1-9379.i586.rpm \
	ooobasis3.0-impress-3.0.1-9379.i586.rpm \
	ooobasis3.0-javafilter-3.0.1-9379.i586.rpm \
	ooobasis3.0-kde-integration-3.0.1-9379.i586.rpm \
	ooobasis3.0-math-3.0.1-9379.i586.rpm \
	ooobasis3.0-onlineupdate-3.0.1-9379.i586.rpm \
	ooobasis3.0-ooofonts-3.0.1-9379.i586.rpm \
	ooobasis3.0-ooolinguistic-3.0.1-9379.i586.rpm \
	ooobasis3.0-pyuno-3.0.1-9379.i586.rpm \
	ooobasis3.0-testtool-3.0.1-9379.i586.rpm \
	ooobasis3.0-writer-3.0.1-9379.i586.rpm \
	ooobasis3.0-xsltfilter-3.0.1-9379.i586.rpm \
	openoffice.org-ure-1.4.1-9379.i586.rpm \
	openoffice.org3-3.0.1-9379.i586.rpm \
	openoffice.org3-base-3.0.1-9379.i586.rpm \
	openoffice.org3-calc-3.0.1-9379.i586.rpm \
	openoffice.org3-dict-en-3.0.1-9379.i586.rpm \
	openoffice.org3-dict-es-3.0.1-9379.i586.rpm \
	openoffice.org3-dict-fr-3.0.1-9379.i586.rpm \
	openoffice.org3-draw-3.0.1-9379.i586.rpm \
	openoffice.org3-en-US-3.0.1-9379.i586.rpm \
	openoffice.org3-impress-3.0.1-9379.i586.rpm \
	openoffice.org3-math-3.0.1-9379.i586.rpm \
	openoffice.org3-writer-3.0.1-9379.i586.rpm \
	desktop-integration/openoffice.org3.0-freedesktop-menus-3.0-9376.noarch.rpm

WRKSRC=	${WRKDIR}/OOO300_m15_native_packed-1_en-US.${OO_BUILD}

OPTIONS=	JAVA "Enable Java Support" off

.include <bsd.port.pre.mk>

LINPROCFS!=	/sbin/mount | ${GREP} linprocfs | ${AWK} '{print $1}'

.if defined(WITH_JAVA)
USE_JAVA=	yes
JAVA_VERSION=	1.4 1.5 1.6
.endif

pre-fetch:
.if !defined(PACKAGE_BUILDING)
.if ${LINPROCFS}
	@${ECHO}
	@${ECHO} Check if linprocfs is running: YES
.else
	@${ECHO} Check if linprocfs is running: NO
	@${ECHO}
	@${ECHO} ERROR:
	@${ECHO}
	@${ECHO} OpenOffice.org setup needs a running linprocfs. it seems
	@${ECHO} that procfs is not mounted on your system.  Please
	@${ECHO} read the linprocfs\(5\) manpage and ensure the
	@${ECHO} the following line is in /etc/fstab, and that the
	@${ECHO} linprocfs file system is mounted:
	@${ECHO}
	@${ECHO} linproc /compat/linux/proc linprocfs rw 0 0
	@${ECHO}
	@${FALSE}
.endif
.if !exists(${LINUXBASE}/etc/mtab)
	@${ECHO}
	@${ECHO} ERROR:
	@${ECHO}
	@${ECHO} The file ${LINUXBASE}/etc/mtab is missing.
	@${ECHO} OpenOffice.org needs this file else some functions
	@${ECHO} are not working. You can create it with
	@${ECHO}
	@${ECHO} touch ${LINUXBASE}/etc/mtab
	@${ECHO}
	@${FALSE}
.else
	@${ECHO} Check if ${LINUXBASE}/etc/mtab exists: YES
.endif
.endif

pre-install:
	${MKDIR} ${WRKDIR}/oo

do-install:
	for fi in ${RPMFILES}; do \
	if !(cd ${WRKDIR}/oo && ${RC_CMD} ${WRKSRC}/RPMS/$$fi ${RC_AFTER_ARGS});\
		then \
			exit 1; \
		fi \
	done
	${RM} -rf ${WRKDIR}/oo/usr/bin/soffice ${WRKDIR}/oo/usr/share/applications
	${CHMOD} -R ug-s ${WRKDIR}/oo
	${CHOWN} -R 0:0 ${WRKDIR}/oo
	${MV} ${WRKDIR}/oo/opt/openoffice.org3 ${PREFIX}
	${MV} ${WRKDIR}/oo/opt/openoffice.org/basis3.0 ${PREFIX}/openoffice.org3/
	${MV} ${WRKDIR}/oo/opt/openoffice.org/ure ${PREFIX}/openoffice.org3/basis3.0/
	${MV} ${WRKDIR}/oo/usr/share/icons ${PREFIX}/share
	${MV} ${WRKDIR}/oo/usr/share/mime ${PREFIX}/share
	${MKDIR} ${PREFIX}/share/applications
	${LN} -sf ${PREFIX}/openoffice.org3/share/xdg/base.desktop ${PREFIX}/share/applications/openoffice.org${OO_VER}-base.desktop
	${LN} -sf ${PREFIX}/openoffice.org3/share/xdg/calc.desktop ${PREFIX}/share/applications/openoffice.org${OO_VER}-calc.desktop
	${LN} -sf ${PREFIX}/openoffice.org3/share/xdg/draw.desktop ${PREFIX}/share/applications/openoffice.org${OO_VER}-draw.desktop
	${LN} -sf ${PREFIX}/openoffice.org3/share/xdg/extension.desktop ${PREFIX}/share/applications/openoffice.org${OO_VER}-extension.desktop
	${LN} -sf ${PREFIX}/openoffice.org3/share/xdg/impress.desktop ${PREFIX}/share/applications/openoffice.org${OO_VER}-impress.desktop
	${LN} -sf ${PREFIX}/openoffice.org3/share/xdg/math.desktop ${PREFIX}/share/applications/openoffice.org${OO_VER}-math.desktop
	${LN} -sf ${PREFIX}/openoffice.org3/share/xdg/printeradmin.desktop ${PREFIX}/share/applications/openoffice.org${OO_VER}-printeradmin.desktop
	${LN} -sf ${PREFIX}/openoffice.org3/share/xdg/writer.desktop ${PREFIX}/share/applications/openoffice.org${OO_VER}-writer.desktop
	${LN} -sf ${PREFIX}/openoffice.org3/program/soffice ${PREFIX}/bin/soffice
	${REINPLACE_CMD} "s,/etc,${TRUE_PREFIX}," \
		${WRKDIR}/oo/usr/bin/openoffice.org3
	${INSTALL} ${WRKDIR}/oo/usr/bin/openoffice.org3 ${PREFIX}/bin/
	${REINPLACE_CMD} -e 's|opt|usr/local|' ${PREFIX}/bin/openoffice.org3
.for i in scalc sdraw simpress swriter
	${LN} -sf ${PREFIX}/openoffice.org3/program/${i} ${PREFIX}/bin/${i}
.endfor

post-install:
	(cd ${PREFIX}/openoffice.org3; ${RM} basis-link; ${LN} -s basis3.0 basis-link )
	(cd ${PREFIX}/openoffice.org3/basis3.0; ${RM} ure-link;  ${LN} -s ure ure-link )

.include <bsd.port.post.mk>
